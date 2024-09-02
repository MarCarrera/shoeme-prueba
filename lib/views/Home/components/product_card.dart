import 'package:flutter/material.dart';
import 'package:shoeme_app/utils/constans.dart';

import '../../../controller/request.dart';
import 'dialogs/edit_dialog.dart';

class ProductCard extends StatefulWidget {
  final Function onRegisterSuccess;
  const ProductCard({
    super.key,
    required this.idCalzado,
    required this.marca,
    required this.modelo,
    required this.precio,
    required this.numero,
    required this.existencia,
    required this.sucursal,
    required this.onRegisterSuccess,
  });
  final String idCalzado;
  final String marca;
  final String modelo;
  final String precio;
  final String numero;
  final String existencia;
  final String sucursal;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  TextEditingController precioC = TextEditingController();

  Future<void> _editarPrecioCalzado() async {
    showUpdateDialog(
      context: context,
      title: 'Editar Precio',
      precioC: precioC,
      onRegisterSuccess: widget.onRegisterSuccess,
      idCalzado: widget.idCalzado,
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Borrar calzado'),
        content: const Text('¿Estás seguro de borrar este calzado?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              bool response = await deleteShoe(idCalzado: widget.idCalzado);

              if (response) {
                Navigator.of(context).pop(response);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Calzado agregado con éxito.')),
                );
                // Llamar al callback para refrescar la vista de HomePage
                widget.onRegisterSuccess();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('No se pudo agregar el calzado.')),
                );
              }
            },
            child: const Text('Si, borrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.02;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      child: Container(
        height: screenHeight * 0.13, //125,
        width: screenWidth * 0.9, //350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0x4A828282),
                  offset: Offset(0, 6),
                  blurRadius: 8,
                  spreadRadius: 4)
            ]),
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Marca:',
                                        style: TextStyle(
                                          fontSize: fontSize * 0.9, //14,
                                        ),
                                      ),
                                      Text(
                                        widget.marca,
                                        style: TextStyle(
                                            fontSize: fontSize, //16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Modelo:',
                                          style: TextStyle(fontSize: fontSize)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(widget.modelo,
                                          style: TextStyle(
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _editarPrecioCalzado();
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      size: fontSize * 1.1,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _logout(context);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      size: fontSize * 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('Precio:',
                                        style: TextStyle(
                                            fontSize: fontSize * 0.8)),
                                    Text('\$${widget.precio}',
                                        style: TextStyle(
                                            color: TColors.yellowColor,
                                            fontSize: fontSize * 1.1,
                                            fontWeight: FontWeight.w700))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Número Pie:',
                                        style: TextStyle(
                                            fontSize: fontSize * 0.8)),
                                    Text('#${widget.numero}',
                                        style: TextStyle(
                                            color: TColors.greenColor,
                                            fontSize: fontSize * 1.1,
                                            fontWeight: FontWeight.w700))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Stock:',
                                        style: TextStyle(
                                            fontSize: fontSize * 0.8)),
                                    Text(
                                      '${widget.existencia} pzs',
                                      style: TextStyle(
                                          color: TColors.blueColor,
                                          fontSize: fontSize * 1.1,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
