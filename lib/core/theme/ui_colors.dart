import 'package:flutter/material.dart';

import '../../utils/linear_interpolation.dart';

const cTransparent = Color.fromRGBO(0, 0, 0, 0);
const cWhite = Color.fromRGBO(255, 255, 255, 1);
const cBlack = Color.fromRGBO(30, 30, 30, 1);

const cGold = Color(0xFFA99A86);

Color adjustOpacity(Color color, double opacity) {
  double red = color.r;
  double green = color.g;
  double blue = color.b;

  return Color.fromRGBO(
    freeInterpolate(red, 0, 1, 0, 255).toInt(),
    freeInterpolate(green, 0, 1, 0, 255).toInt(),
    freeInterpolate(blue, 0, 1, 0, 255).toInt(),
    opacity,
  );
}
