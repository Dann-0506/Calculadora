import 'package:flutter/material.dart';

class ScientificCalculatorPage extends StatelessWidget {
  
  const ScientificCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Calculadora Científica'),
      ),
      body: Center(
        child: Text(
          'Calculadora Científica en desarrollo',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}