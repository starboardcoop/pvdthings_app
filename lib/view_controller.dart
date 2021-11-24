import 'package:flutter/material.dart';
import 'package:pvd_things_app/views/browse.dart';

class ViewController extends StatefulWidget {
  const ViewController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ViewControllerState();
  }
}

class _ViewControllerState extends State<ViewController> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BrowsePage(),
    );
  }
}
