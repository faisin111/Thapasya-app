import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const primaryColor = Color.fromARGB(255, 255, 0, 0);
  static const secondaryColor = Color.fromARGB(255, 249, 247, 243);
  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const textColor = Color.fromARGB(255, 0, 0, 0);
  static const greyColor = Color.fromARGB(255, 174, 174, 174);
  static const borderColor = Color.fromARGB(255, 177, 177, 177);
  static const whiteColor = Color.fromARGB(255, 255, 255, 255);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarThemeData(
      elevation: 0,
      foregroundColor: whiteColor,
      backgroundColor: primaryColor,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: whiteColor,
        backgroundColor: primaryColor,
        elevation: 0,
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 255, 64, 50),
          width: 1,
        ),
      ),
    ),
  );
}
