import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/theme/extension.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).extension<CustomTheme>()!;
    return Scaffold(
      body: Text("Hello World", style:theme.texts.title),
      backgroundColor: theme.palette.background,
    );
  }
}