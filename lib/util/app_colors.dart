import 'package:flutter/material.dart';

class AppColors{
  static const String _color1='#0CCAED';
  static const String _color2='#01EC8F';
  static const String _color3='#FD4C9A';
  static const String _color4='#ED2700';

  static textcolor() {
    return getColorFromHex(_color1);
  }

  static color2() {
    return getColorFromHex(_color2);
  }

  static color3() {
    return getColorFromHex(_color3);
  }

  static color4() {
    return getColorFromHex(_color4);
  }

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}