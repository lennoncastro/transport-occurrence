import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transport_occurrence/core/ds/colors.dart';

mixin AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );
}
