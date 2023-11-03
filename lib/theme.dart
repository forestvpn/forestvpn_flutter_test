import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        fontFamily: 'SF Pro Display',
        appBarTheme: const AppBarTheme(
          color: Color(0xfff9f9f9),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      );

  static const verticalSpacing = SizedBox(height: 20);
  static const cardHeadlineTextStyle =
      TextStyle(color: Colors.white, fontSize: 28);
}
