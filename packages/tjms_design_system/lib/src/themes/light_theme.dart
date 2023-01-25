//tema claro
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get instance => ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 213, 174, 220),
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.white,
        ),
      );
}
