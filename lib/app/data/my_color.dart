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

  int hexOfRGBA(int r, int g, int b, {double opacity = 1}) {
    r = (r < 0) ? -r : r;
    g = (g < 0) ? -g : g;
    b = (b < 0) ? -b : b;
    opacity = (opacity < 0) ? -opacity : opacity;
    opacity = (opacity > 1) ? 255 : opacity * 255;
    r = (r > 255) ? 255 : r;
    g = (g > 255) ? 255 : g;
    b = (b > 255) ? 255 : b;
    int a = opacity.toInt();
    return int.parse(
        '0x${a.toRadixString(16)}${r.toRadixString(16)}${g.toRadixString(16)}${b.toRadixString(16)}');
  }

  MaterialColor createMaterialColor() {
    var hexCode = hexOfRGBA(r, g, b);
    return MaterialColor(hexCode, <int, Color>{
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
