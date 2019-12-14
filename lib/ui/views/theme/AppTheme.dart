import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Colors.red,
      accentColor: Colors.black87,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.black12,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(gapPadding: 0.0),
      ),

    );

  static ThemeData darkTheme = ThemeData();

  static ThemeData loginTheme = ThemeData();
  static ThemeData mainTheme = ThemeData();



}