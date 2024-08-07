import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Color(0xFF3C4CBD),
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.black),
      foregroundColor: WidgetStateProperty.all(Colors.white),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red,
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Colors.blue, // SnackBar arka plan rengi
    contentTextStyle: TextStyle(color: Colors.white), // SnackBar metin rengi
    actionTextColor: Colors.yellow, //
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
  ),
);
