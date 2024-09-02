import 'package:flutter/material.dart';
import 'package:shoeme_app/utils/constans.dart';
import 'views/Home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.02;
    double paddingSize = screenWidth * 0.05;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: TColors.backgrondColor,
          appBar: AppBar(
            backgroundColor: TColors.backgrondColor,
            title: Text(
              'ShoeMe App',
              style: TextStyle(
                  fontSize: fontSize * 1.4, fontWeight: FontWeight.w700),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingSize),
                child: Icon(
                  Icons.notification_add_rounded,
                  size: fontSize * 1.4,
                ),
              )
            ],
          ),
          body: HomePage()),
    );
  }
}
