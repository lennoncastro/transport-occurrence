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
        color: Color(0xff515458),
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.71,
        letterSpacing: 0,
        color: Color(0xff515458),
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0,
        color: Color(0xff515458),
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.6,
        letterSpacing: 0,
        color: Color(0xff515458),
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 22,
        height: 1.0,
        letterSpacing: 0,
        color: Color(0xff515458),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 48)),
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 15,
            height: 1.6,
            letterSpacing: 0,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        elevation: WidgetStatePropertyAll(0),
      ),
    ),
  );
}
