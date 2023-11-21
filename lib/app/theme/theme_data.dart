import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xFF6AE3C7),
    secondaryHeaderColor: Color(0xFF4B4AE4),
    scaffoldBackgroundColor: Color(0xffE7E7FF),
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF6AE3C7), centerTitle: true, elevation: 0),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF6AE3C7)),
            elevation: MaterialStateProperty.all<double>(0.5),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xFF6AE3C7)))))),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none)),
    buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF6AE3C7), textTheme: ButtonTextTheme.primary),
  );
}
