import 'package:flutter/material.dart';

class ColorsManagement {
  static Color primary = HexColor.fromHex('#ffcda3');
  static Color darkPrimary = HexColor.fromHex('#ffbc85');
  static Color onPrimary = HexColor.fromHex('#425c5a');
  static Color primaryContainer = HexColor.fromHex('#425c5a');
  static Color onPrimaryContainer = HexColor.fromHex('#FFFFFF');
  static Color secondary = HexColor.fromHex('#5b7775');
  static Color onSecondary = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#BA1A1A');
  static Color onError = HexColor.fromHex('#FFFFFF');
  static Color background = HexColor.fromHex('#F3FFFA');
  static Color onBackground = HexColor.fromHex('#425c5a');
  static Color surface = HexColor.fromHex('#F3FFFA');
  static Color onSurface = HexColor.fromHex('#00201A');
  static Color outline = HexColor.fromHex('#85736F');
  static Color shadow = HexColor.fromHex('#000000');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; //! 8 Char with 100% opacity
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
