import'package:flutter/material.dart';



class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
    fontFamily: 'Raleway',
    scaffoldBackgroundColor: const Color.fromARGB(255, 234, 229, 213),
    canvasColor: const Color.fromARGB(222, 145, 175, 196),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'RobotoCondensed',
        fontSize: 28,
      ),
    ),

    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
      bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
      titleMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.bold,
      ),
    ),

    primaryColor: Colors.blueGrey,
  );
}
  