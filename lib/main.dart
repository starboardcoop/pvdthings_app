import 'package:flutter/material.dart';
import 'package:pvd_things_app/view_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PVD Things',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xfffcd34d),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ViewController(),
    );
  }
}
