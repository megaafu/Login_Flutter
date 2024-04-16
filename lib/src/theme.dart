import 'package:flutter/material.dart';

Color primary = const Color(0xFF5E975A);
Color secondary = const Color(0xff282828);
Color lightText = const Color(0xfff2f2f2);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primary,
      foregroundColor: lightText,
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primary,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primary,
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(60),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primary,
      foregroundColor: lightText,
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: lightText,
    ),
  ),
);
