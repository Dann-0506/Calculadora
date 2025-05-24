import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color buttonBackground;

  const CustomColors({
    required this.buttonBackground,
  });

  @override
  CustomColors copyWith({
    Color? buttonBackground,
  }) {
    return CustomColors(
      buttonBackground: buttonBackground ?? this.buttonBackground,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      buttonBackground: Color.lerp(buttonBackground, other.buttonBackground, t)!,
    );
  }
}

// Definición de los temas personalizados
final ThemeData blueTheme = ThemeData(
  colorScheme: ColorScheme.light(
    background: Color(0xFFFFFFFF),
    primary: Color(0xFFE6E6E6), // operador
    secondary: Color(0xFF007AFF), // AC, ⌫, %
    onSurface: Color(0xFF1C1C1E), // texto
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFE0F2FF),
    ),
  ],
);

final ThemeData greenTheme = ThemeData(
  colorScheme: ColorScheme.light(
    background: Color(0xFFFAFAFA),
    primary: Color(0xFFDCDCDC),
    secondary: Color(0xFF2E8B57),
    onSurface: Color(0xFF202124),
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFD0F0C0),
    ),
  ],
);

final ThemeData yellowTheme = ThemeData(
  colorScheme: ColorScheme.light(
    background: Color(0xFFF9F6F1),
    primary: Color(0xFFEDEDED),
    secondary: Color(0xFFF4C430),
    onSurface: Color(0xFF333333),
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFFFFACD),
    ),
  ],
);

final ThemeData purpleTheme = ThemeData(
  colorScheme: ColorScheme.light(
    background: Color(0xFFF6F3FF),
    primary: Color(0xFFECECEC),
    secondary: Color(0xFF7E57C2),
    onSurface: Color(0xFF2C2C2C),
  ),
  extensions: const [
    CustomColors(
      buttonBackground: Color(0xFFE8E0FF),
    ),
  ],
);