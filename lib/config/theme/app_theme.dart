import 'package:bq_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.defaultBgColor,
          foregroundColor: AppColors.primaryColor),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: AppColors.defaultBgColor,
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.8))),
      ));
}
