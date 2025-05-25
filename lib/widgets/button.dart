import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String value;
  final Color color;
  final Function(String) onPressed;

  const Button({
    super.key,
    required this.value,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool islightTheme = ThemeData.estimateBrightnessForColor(color) == Brightness.light;
    final Color colorText = islightTheme ? Colors.black : Colors.white;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 70,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: colorText,
              textStyle: const TextStyle(fontSize: 26),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),  
            onPressed: () => onPressed(value),
            child: Text(value),
          ),
        )
      ),
    );
  }
}
