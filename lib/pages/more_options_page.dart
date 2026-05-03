import 'package:flutter/material.dart';
import 'package:calculadora/pages/historial_page.dart';
import 'package:calculadora/pages/settings_page.dart';

class MoreOptionsPage extends StatelessWidget {
  const MoreOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('Más funciones')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Historial'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HistorialPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
