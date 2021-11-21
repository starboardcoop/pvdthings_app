import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Me"),
      ),
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          scale: 4.0,
        ),
      ),
    );
  }
}
