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