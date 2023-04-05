import 'package:flutter/material.dart';
import 'package:ongkos/app/core/values/colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryBlue,
    primaryColorDark: backgroundNav,
    primaryColorLight: blueAccent,
    canvasColor: backgroundNav,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: grey,
    canvasColor: backgroundNav,
    primaryColor: primaryPurple,
    primaryColorLight: purpleAccent,
    primaryColorDark: darkGrey,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    ),
  );
}
