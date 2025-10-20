import 'package:flutter_project/presentation/theme/palette.dart';
import 'package:flutter/material.dart';

class Texts {
  final Palette palette;

  Texts({required this.palette});

  TextStyle get title => TextStyle(
    color: palette.text,
    fontSize: 16,
    fontFamily: 'ComicNeue',
    fontWeight: FontWeight.w700,
  );

  TextStyle get text => TextStyle(
    color: palette.text,
    fontSize: 12,
    fontFamily: 'ComicNeue',
    fontWeight: FontWeight.w400,
  );

  TextStyle get medium => TextStyle(
    color: palette.text,
    fontSize: 14,
    fontFamily: 'ComicNeue',
    fontWeight: FontWeight.w500,
  );
}