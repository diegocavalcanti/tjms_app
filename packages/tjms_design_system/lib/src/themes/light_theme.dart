//tema claro
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get instance => ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 229, 224, 230),
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.white,
          tertiary: Colors.green
        ),
        
        
      );
}
