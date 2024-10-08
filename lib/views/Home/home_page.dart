import 'package:flutter/material.dart';
import 'package:shoeme_app/controller/request.dart';
import 'package:shoeme_app/utils/constans.dart';
import '../../models/view_model.dart';

import 'components/add_button.dart';
import 'components/product_card.dart';
import 'components/search_input.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });
  final TextEditingController? editTextController = TextEditingController();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Calzado>> futureCalzado;
  bool hasCalzados = true;

  @override
  void initState() {
    super.initState();
    futureCalzado = getShoes();
  }

  void _refreshData() {
    setState(() {
      futureCalzado = getShoes();
    });
  }

  //actualizar el futuro al consultar calzados por sucursal
  void _updateCalzados(List<Calzado> calzados) {
    setState(() {
      futureCalzado = Future.value(calzados);
    });
  }

  void _onCalzadosSelected(List<Calzado> calzados) {
    setState(() {
      if (calzados.isEmpty) {
        hasCalzados = false;
      } else {
        hasCalzados = true;
        futureCalzado =
            Future.value(calzados); // Actualiza la lista de calzados
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.backgrondColor,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: 10,
            ),
            RefreshIndicator(
              onRefresh: () async {
                _refreshData();
              },
              child: Column(
                children: [
                  SearchInput(
                      onCalzadosSelected: _updateCalzados,
                      onRefreshSuccess: _refreshData),
                  SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: FutureBuilder<List<Calzado>>(
                      future: futureCalzado,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Muestra un indicador de carga mientras los datos se están cargando
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          // Muestra un mensaje de error
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          // Muestra un mensaje si no hay datos disponibles
                          return Center(
                              child: Text('No hay calzados disponibles'));
                        } else {
                          // Ordena la lista por id de manera descendiente
                          final calzados = snapshot.data!
                            ..sort(
                                (a, b) => b.idCalzado.compareTo(a.idCalzado));
                          return ListView.builder(
                            itemCount: calzados.length,
                            itemBuilder: (context, index) {
                              final calzado = calzados[index];
                              return ProductCard(
                                marca: calzado.marca,
                                modelo: calzado.modelo,
                                precio: calzado.precio,
                                numero: calzado.numPie.toString(),
                                existencia: calzado.existencia.toString(),
                                sucursal: calzado.nombreAlmacen,
                                idCalzado: calzado.idCalzado.toString(),
                                onRegisterSuccess: _refreshData,
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  // Botón agregar calzado
                ],
              ),
            ),
            AddButton(onRefreshSuccess: _refreshData),
          ],
        ),
      ),
    );
  }
}
