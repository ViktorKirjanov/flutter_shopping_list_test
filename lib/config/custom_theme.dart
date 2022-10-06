import 'package:flutter/material.dart';

class CustomTheme {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color greyishBlue = Color.fromRGBO(245, 245, 248, 1);
  static const Color semiGray = Color.fromRGBO(200, 199, 204, 1);
  static const Color grey = Colors.grey;
  static const Color darkGray = Color.fromRGBO(114, 114, 119, 1);
  static const Color darkestGrey = Color.fromRGBO(34, 34, 34, 1);
  static const Color black = Color.fromRGBO(30, 32, 38, 1);
  static const Color red = Color.fromARGB(255, 188, 80, 67);
  static const Color green = Color.fromARGB(255, 46, 133, 115);
  static const Color yellow = Color.fromARGB(255, 249, 235, 104);

  static const smallRadius = BorderRadius.all(Radius.circular(8.0));
  static const bigRadius = BorderRadius.all(Radius.circular(16.0));
  static const mainPadding = 16.0;
  static const secondaryPadding = 8.0;
  static const contentPadding = EdgeInsets.all(mainPadding);
  static const productItemsInRow = 3;
  static const productItemHeight = 100.0;
  static const newShoppingInRow = 2;
  static const newShoppingHeight = 100.0;
  static const bigShoppingListHeight = 125.0;
  static const gridSpacing = 4.0;

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
        borderRadius: smallRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: semiGray),
        borderRadius: smallRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkGray),
        borderRadius: smallRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: semiGray),
        borderRadius: smallRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: smallRadius,
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

  static const header1 = TextStyle(
    color: CustomTheme.white,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static const header2 = TextStyle(
    color: CustomTheme.white,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  static const text = TextStyle(
    color: CustomTheme.white,
  );

  static const textBold = TextStyle(
    color: CustomTheme.white,
    fontWeight: FontWeight.bold,
  );

  static const buttonText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
  );
}
