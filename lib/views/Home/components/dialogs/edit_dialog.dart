import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:lottie/lottie.dart';

import '../../../../controller/request.dart';

class EditDialog extends StatefulWidget {
  final String title;
  final String idCalzado;
  final TextEditingController precioC;
  final bool obscureText;
  final Function onRegisterSuccess;

  const EditDialog({
    super.key,
    required this.title,
    required this.idCalzado,
    required this.precioC,
    this.obscureText = false,
    required this.onRegisterSuccess,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late TextEditingController _precioC;

  @override
  void initState() {
    super.initState();
    _precioC = TextEditingController(text: widget.precioC.text);
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
              controller: _precioC,
              keyboardType: TextInputType.number,
              obscureText: widget.obscureText,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Precio'),
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
          child: const Text('Editar'),
          onPressed: () async {
            widget.precioC.text = _precioC.text;

            bool response = await updateShoe(
              precio: widget.precioC.text,
              idCalzado: widget.idCalzado,
            );

            if (response) {
              widget.precioC.text = '';
              Navigator.of(context).pop(response);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Precio editado con éxito.')),
              );
              // Llamar al callback para refrescar la vista de HomePage
              widget.onRegisterSuccess();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No se guardaron los cambios.')),
              );
            }
          },
        ),
      ],
    );
  }
}

void showUpdateDialog({
  required BuildContext context,
  required String title,
  required String idCalzado,
  required TextEditingController precioC,
  bool obscureText = false,
  required Function onRegisterSuccess,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return EditDialog(
        title: title,
        obscureText: obscureText,
        precioC: precioC,
        onRegisterSuccess: onRegisterSuccess,
        idCalzado: idCalzado,
      );
    },
  );
}
