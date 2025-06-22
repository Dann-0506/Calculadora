import 'package:flutter/material.dart';

class HistorialPage extends StatelessWidget {

  const HistorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
      ),
      body: Center(
        child: Text(
          'Historial en desarrollo',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}