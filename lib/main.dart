import 'package:flutter/material.dart';
import 'package:shoeme_app/utils/constans.dart';

import 'utils/prueba.dart';
import 'views/Home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: TColors.backgrondColor,
          appBar: AppBar(
            backgroundColor: TColors.backgrondColor,
            title: const Text('Bienvenido'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(Icons.notification_add_rounded),
              )
            ],
          ),
          body: HomePage()),
    );
  }
}
