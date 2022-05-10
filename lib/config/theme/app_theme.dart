import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Colors.black,
      ),
      inputDecorationTheme:  InputDecorationTheme(
        border: const OutlineInputBorder(),
        enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.8))),
      ));
}
