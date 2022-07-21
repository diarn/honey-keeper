import 'package:flutter/material.dart';

class MyColors {
  static MaterialColor get primary => GenerateColor(
        r: 251,
        b: 45,
        g: 192,
      ).createMaterialColor();
  static MaterialColor get primaryLight => GenerateColor(
        r: 251,
        b: 99,
        g: 242,
      ).createMaterialColor();
  static MaterialColor get primaryDark => GenerateColor(
        r: 196,
        b: 0,
        g: 144,
      ).createMaterialColor();

  static MaterialColor get errorColor => GenerateColor(
        r: 211,
        b: 47,
        g: 47,
      ).createMaterialColor();

  static MaterialColor get textColor1 => GenerateColor(
        r: 33,
        b: 33,
        g: 33,
      ).createMaterialColor();
}

class GenerateColor {
  final int r;
  final int g;
  final int b;
  GenerateColor({
    required this.r,
    required this.g,
    required this.b,
  });

  MaterialColor createMaterialColor() {
    return MaterialColor(500, <int, Color>{
      50: Color.fromARGB(26, r, g, b),
      100: Color.fromARGB(51, r, g, b),
      200: Color.fromARGB(77, r, g, b),
      300: Color.fromARGB(102, r, g, b),
      400: Color.fromARGB(128, r, g, b),
      500: Color.fromARGB(153, r, g, b),
      600: Color.fromARGB(179, r, g, b),
      700: Color.fromARGB(204, r, g, b),
      800: Color.fromARGB(229, r, g, b),
      900: Color.fromARGB(255, r, g, b),
    });
  }
}
