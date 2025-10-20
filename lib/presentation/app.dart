import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/theme/extension.dart';
import 'package:flutter_project/presentation/theme/palette.dart';
import 'package:flutter_project/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Flutter Demo',
  debugShowCheckedModeBanner: false,
  home: const MyHomePage(title: 'Flutter Demo Home Page'),
  theme: ThemeData().copyWith(extensions: [CustomTheme(LightPalette())]),
  darkTheme: ThemeData().copyWith(extensions: [CustomTheme(DarkPalette())]),
  );
}
}