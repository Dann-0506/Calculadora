import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color buttonBackground;
  final Color operatorColor;
  final Color textColor;
  final Color auxiliaryColor;

  const CustomColors({
    required this.buttonBackground,
    required this.operatorColor,
    required this.textColor,
    required this.auxiliaryColor,
  });

  @override
  CustomColors copyWith({
    Color? buttonBackground,
    Color? operatorColor,
    Color? textColor,
    Color? auxiliaryColor,
  }) {
    return CustomColors(
      buttonBackground: buttonBackground ?? this.buttonBackground,
      operatorColor: operatorColor ?? this.operatorColor,
      textColor: textColor ?? this.textColor,
      auxiliaryColor: auxiliaryColor ?? this.auxiliaryColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      buttonBackground: Color.lerp(buttonBackground, other.buttonBackground, t)!,
      operatorColor: Color.lerp(operatorColor, other.operatorColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      auxiliaryColor: Color.lerp(auxiliaryColor, other.auxiliaryColor, t)!,
    );
  }
}

ThemeData getThemeWithMode(int index, {bool darkMode = false}) {
  final baseTheme = darkMode ? ThemeData.dark() : ThemeData.light();
  final selectedTheme = darkMode ? darkThemes[index] : lightThemes[index];
  final customColors = selectedTheme.extension<CustomColors>();

  return baseTheme.copyWith(
    colorScheme: selectedTheme.colorScheme,
    extensions: [
      if (customColors != null) customColors,
    ],
  );
}

// Listas de temas para modo oscuro
final List<ThemeData> darkThemes = [
  blueDarkTheme,
  greenDarkTheme,
  yellowDarkTheme,
  purpleDarkTheme,
];

// Listas de temas para modo claro
final List<ThemeData> lightThemes = [
  blueTheme,
  greenTheme,
  yellowTheme,
  purpleTheme,
];

// Definición de los temas personalizados para modo claro
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

// Definición de los temas personalizados para modo oscuro
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
