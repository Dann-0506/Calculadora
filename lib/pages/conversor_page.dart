import 'package:flutter/material.dart';

class ConversorPage extends StatelessWidget {
  const ConversorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('Conversor de Unidades')),
      body: Center(
        child: Text(
          'Conversor de Unidades en desarrollo',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
