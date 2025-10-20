import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/theme/extension.dart';

void showLoadin(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      var theme = Theme.of(context).extension<CustomTheme>()!;
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Center(
          child: CircularProgressIndicator(color: theme.palette.text),
        ),
      );
    },
  );
}