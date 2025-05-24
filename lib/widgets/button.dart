import 'package:flutter/material.dart';
import 'package:calculadora/themes/theme.dart';

class Button extends StatelessWidget {
  final String value;
  final Color? color;
  final bool isWide;
  final Function(String) onPressed;

  const Button({
    super.key,
    required this.value,
    this.color,
    this.isWide = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isWide ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppTheme.buttonBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => onPressed(value),
          child: Text(
            value,
            style: const TextStyle(fontSize: 20, color: AppTheme.textColor),
          ),
        ),
      ),
    );
  }
}