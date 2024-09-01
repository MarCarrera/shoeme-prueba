import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.02;
    double paddingSize = screenWidth * 0.05;

    return Padding(
      padding: EdgeInsets.only(top: paddingSize),
      child: Container(
        height: screenHeight * 0.052, //125,
        width: screenWidth * 0.7,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36),
            boxShadow: [
              BoxShadow(
                  color: Color(0x4A828282),
                  offset: Offset(0, 6),
                  blurRadius: 8,
                  spreadRadius: 4)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Buscar modelo',
                style: TextStyle(fontSize: fontSize * 0.9),
              ),
              Icon(Icons.search)
            ],
          ),
        ),
      ),
    );
  }
}
