import 'package:flutter/material.dart';
import 'package:calculadora/themes/theme_extensions.dart';

final List<ThemeData> darkThemes = [
  blueDarkTheme,
  greenDarkTheme,
  yellowDarkTheme,
  purpleDarkTheme,
];

final ThemeData blueDarkTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    primary: Color(0xFF007AFF),
    onSurface: Colors.white,
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFE0F2FF),
      operatorColor: Colors.white,
      textColor: Colors.white,
      auxiliaryColor: Color(0xFF007AFF),
    ),
  ],
);

final ThemeData greenDarkTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    primary: Color(0xFF2E8B57),
    onSurface: Colors.white,
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFD0F0C0),
      operatorColor: Colors.white,
      textColor: Colors.white,
      auxiliaryColor: Color(0xFF2E8B57),
    ),
  ],
);

final ThemeData yellowDarkTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    primary: Color(0xFFF4C430),
    onSurface: Colors.white,
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFFFFACD),
      operatorColor: Colors.white,
      textColor: Colors.white,
      auxiliaryColor: Color(0xFFF4C430),
    ),
  ],
);

final ThemeData purpleDarkTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    primary: Color(0xFF7E57C2),
    onSurface: Colors.white,
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFE8E0FF),
      operatorColor: Colors.white,
      textColor: Colors.white,
      auxiliaryColor: Color(0xFF7E57C2),
    ),
  ],
);
