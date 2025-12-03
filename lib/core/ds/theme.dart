import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transport_occurrence/core/ds/colors.dart';

mixin AppTheme {
  static String fontFamily = 'Inter';

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: fontFamily,
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
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.0,
        letterSpacing: 0,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );
}
