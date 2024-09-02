import 'package:flutter/material.dart';

import '../../../utils/constans.dart';
import 'dialogs/add_dialog.dart';

class AddButton extends StatefulWidget {
  final Function onRefreshSuccess;
  const AddButton({
    super.key,
    required this.onRefreshSuccess,
  });

  @override
  State<AddButton> createState() => _AddButtonState();
}

TextEditingController modeloC = TextEditingController();
TextEditingController marcaC = TextEditingController();
TextEditingController numPieC = TextEditingController();
TextEditingController precioC = TextEditingController();
TextEditingController existenciaC = TextEditingController();
TextEditingController almacenC = TextEditingController();

class _AddButtonState extends State<AddButton> {
  Future<void> _agregarCalzado() async {
    showEditDialog(
      context: context,
      title: 'Agregar Calzado',
      modeloC: modeloC,
      marcaC: marcaC,
      numPieC: numPieC,
      precioC: precioC,
      existenciaC: existenciaC,
      almacenC: almacenC,
      onRefreshSuccess: widget.onRefreshSuccess,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.02;
    double paddingSize = screenWidth * 0.05;

    return Positioned(
      top: screenHeight * 0.82,
      left: screenWidth * 0.8,
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 0),
        child: ElevatedButton(
          onPressed: () async {
            await _agregarCalzado();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: TColors.blueColor,
            padding: const EdgeInsets.symmetric(vertical: 9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Container(
            height: screenHeight * 0.034,
            child: Center(
              child: Icon(
                Icons.add,
                size: fontSize * 1.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
