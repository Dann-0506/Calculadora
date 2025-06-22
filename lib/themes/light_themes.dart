import 'package:flutter/material.dart';
import 'package:calculadora/themes/theme_extensions.dart';

final List<ThemeData> lightThemes = [
  blueTheme,
  greenTheme,
  yellowTheme,
  purpleTheme,
];

final ThemeData blueTheme = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color(0xFFFAFAFA),
    primary: Color(0xFF007AFF),
    onSurface: Color(0xFF1C1C1E),
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFE0F2FF),
      operatorColor: Color(0xFFE6E6E6),
      textColor: Color(0xFF1C1C1E),
      auxiliaryColor: Color(0xFF007AFF),
    ),
  ],
);

final ThemeData greenTheme = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color(0xFFFAFAFA),
    primary: Color(0xFF2E8B57),
    onSurface: Color(0xFF202124),
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFD0F0C0),
      operatorColor: Color(0xFFDCDCDC),
      textColor: Color(0xFF202124),
      auxiliaryColor: Color(0xFF2E8B57),
    ),
  ],
);

final ThemeData yellowTheme = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color(0xFFFAFAFA),
    primary: Color(0xFFF4C430),
    onSurface: Color(0xFF333333),
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFFFFACD),
      operatorColor: Color(0xFFEDEDED),
      textColor: Color(0xFF333333),
      auxiliaryColor: Color(0xFFF4C430),
    ),
  ],
);

final ThemeData purpleTheme = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color(0xFFFAFAFA),
    primary: Color(0xFF7E57C2),
    onSurface: Color(0xFF2C2C2C),
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFE8E0FF),
      operatorColor: Color(0xFFECECEC),
      textColor: Color(0xFF2C2C2C),
      auxiliaryColor: Color(0xFF7E57C2),
    ),
  ],
);

