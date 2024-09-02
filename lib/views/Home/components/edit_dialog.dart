import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/request.dart';

class EditDialog extends StatefulWidget {
  final String title;
  final TextEditingController modeloC;
  final TextEditingController marcaC;
  final TextEditingController numPieC;
  final TextEditingController precioC;
  final TextEditingController existenciaC;
  final TextEditingController almacenC;
  final bool obscureText;

  const EditDialog({
    super.key,
    required this.title,
    required this.modeloC,
    required this.marcaC,
    required this.numPieC,
    required this.precioC,
    required this.existenciaC,
    required this.almacenC,
    this.obscureText = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late TextEditingController _modeloC;
  late TextEditingController _marcaC;
  late TextEditingController _numPieC;
  late TextEditingController _precioC;
  late TextEditingController _existenciaC;
  late TextEditingController _almacenC;

  @override
  void initState() {
    super.initState();
    _modeloC = TextEditingController(text: widget.modeloC.text);
    _marcaC = TextEditingController(text: widget.marcaC.text);
    _numPieC = TextEditingController(text: widget.numPieC.text);
    _precioC = TextEditingController(text: widget.precioC.text);
    _existenciaC = TextEditingController(text: widget.existenciaC.text);
    _almacenC = TextEditingController(text: widget.almacenC.text);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Add this line
          children: [
            TextField(
              controller: _modeloC,
              keyboardType: TextInputType.text,
              obscureText: widget.obscureText,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Modelo'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _marcaC,
              keyboardType: TextInputType.text,
              obscureText: widget.obscureText,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Marca'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _numPieC,
              keyboardType: TextInputType.number,
              obscureText: widget.obscureText,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Número'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _precioC,
              keyboardType: TextInputType.number,
              obscureText: widget.obscureText,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Precio'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _existenciaC,
              keyboardType: TextInputType.number,
              obscureText: widget.obscureText,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Stock'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _almacenC,
              keyboardType: TextInputType.text,
              obscureText: widget.obscureText,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Sucursal'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Registrar'),
          onPressed: () async {
            widget.modeloC.text = _modeloC.text;
            widget.marcaC.text = _marcaC.text;
            widget.numPieC.text = _numPieC.text;
            widget.precioC.text = _precioC.text;
            widget.existenciaC.text = _existenciaC.text;
            widget.almacenC.text = _almacenC.text;
            await addNewShoe(
               modelo: widget.modeloC.text, 
               marca: widget.marcaC.text,
              numPie: widget.numPieC.text, 
              precio:  widget.precioC.text, 
              existencia: widget.existenciaC.text, 
              almacen: widget.almacenC.text,
              
            );
            Navigator.of(context).pop();
            // Dialogs.bottomMaterialDialog(
            //   msg: 'Registro exitoso.',
            //   title: 'Agregado!',
            //   color: Colors.white,
            //   lottieBuilder: Lottie.asset(
            //     'assets/js/cong_example.json',
            //     fit: BoxFit.contain,
            //   ),
            //   context: context,
            // );
          },
        ),
      ],
    );
  }
}

void showEditDialog({
  required BuildContext context,
  required String title,
  required TextEditingController modeloC,
  required TextEditingController marcaC,
  required TextEditingController numPieC,
  required TextEditingController precioC,
  required TextEditingController existenciaC,
  required TextEditingController almacenC,
  bool obscureText = false,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return EditDialog(
        title: title,
        obscureText: obscureText,
        modeloC: modeloC,
        marcaC: marcaC,
        numPieC: numPieC,
        precioC: precioC,
        existenciaC: existenciaC,
        almacenC: almacenC,
      );
    },
  );
}
