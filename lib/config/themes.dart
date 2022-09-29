import 'package:flutter/material.dart';

class Themes {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color greyishBlue = Color.fromRGBO(245, 245, 248, 1);
  static const Color semiGray = Color.fromRGBO(200, 199, 204, 1);
  static const Color grey = Colors.grey;
  static const Color darkGray = Color.fromRGBO(114, 114, 119, 1);
  static const Color darkestGrey = Color.fromRGBO(34, 34, 34, 1);
  static const Color black = Color.fromRGBO(30, 32, 38, 1);

  static const Color red = Color.fromARGB(255, 188, 80, 67);
  static const Color green = Color.fromARGB(255, 46, 133, 115);

  static const borderRadius = BorderRadius.all(Radius.circular(8.0));
  static const contentPadding = EdgeInsets.all(16.0);

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: greyishBlue,
    appBarTheme: const AppBarTheme(
      backgroundColor: greyishBlue,
      foregroundColor: black,
      iconTheme: IconThemeData(
        color: black,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: contentPadding,
      filled: true,
      fillColor: white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: semiGray),
        borderRadius: borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: semiGray),
        borderRadius: borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkGray),
        borderRadius: borderRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: semiGray),
        borderRadius: borderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: borderRadius,
      ),
      errorStyle: TextStyle(
        color: red,
      ),
      errorMaxLines: 2,
      labelStyle: TextStyle(color: darkGray),
      hintStyle: TextStyle(color: darkGray),
    ),
    iconTheme: const IconThemeData(color: darkGray),
  );
}
