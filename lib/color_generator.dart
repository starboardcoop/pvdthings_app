import 'package:flutter/material.dart';

class ColorGenerator {
  static final List<Color> _colors = <Color>[
    Colors.red,
    Colors.indigo,
    Colors.teal,
    Colors.orange,
    Colors.purple,
  ];

  static Color generate(String seed) {
    int index = seed.hashCode % _colors.length;
    return _colors[index];
  }
}
