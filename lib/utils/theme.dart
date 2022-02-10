import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
  colorScheme: const ColorScheme(
    background: Colors.black,
    brightness: Brightness.dark,
    error: Colors.redAccent,
    onBackground: Colors.white,
    onError: Colors.red,
    onPrimary: Colors.blueGrey,
    onSecondary: Colors.brown,
    onSurface: Colors.amberAccent,
    primary: Colors.blue,
    secondary: Colors.grey,
    surface: Colors.cyan,
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
  ),
  fontFamily: 'AirbnbCereal',
);
