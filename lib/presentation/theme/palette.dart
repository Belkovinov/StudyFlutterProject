import 'package:flutter/material.dart';

abstract class Palette {
  abstract Color background;
  abstract Color text;
}

class DarkPalette extends Palette {
  @override
  Color background = Colors.black;

  @override
  Color text = Colors.white;
}

class LightPalette extends Palette {
  @override
  Color background = Colors.white;

  @override
  Color text = Colors.black;
}