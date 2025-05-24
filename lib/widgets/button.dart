import 'package:calculadora/themes/theme.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String value;
  final Color? color;
  final Function(String) onPressed;

  const Button({
    super.key,
    required this.value,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 80,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? customColors.buttonBackground,
              foregroundColor: theme.colorScheme.onSurface,
              textStyle: const TextStyle(fontSize: 24),
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