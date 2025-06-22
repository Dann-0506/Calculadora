import 'package:flutter/material.dart';

class PreviewButton extends StatelessWidget {
  final String value;
  final Color color;

  const PreviewButton({
    super.key,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = ThemeData.estimateBrightnessForColor(color) == Brightness.light;
    final Color colorText = isLightTheme ? Colors.black : Colors.white;

    return GestureDetector(
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(color: colorText, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}