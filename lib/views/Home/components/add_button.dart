import 'package:flutter/material.dart';

import '../../../utils/constans.dart';

class AddButton extends StatefulWidget {
  const AddButton({
    super.key,
  });

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.02;
    double paddingSize = screenWidth * 0.05;

    return Positioned(
      top: screenHeight * 0.78,
      left: screenWidth * 0.72,
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 0),
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return const AddScreen();
            //     },
            //   ),
            // );
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
