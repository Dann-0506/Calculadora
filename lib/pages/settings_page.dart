import 'package:flutter/material.dart';
import 'package:calculadora/themes/theme.dart';

class SettingsPage extends StatelessWidget {
  final String title;
  final int selectedThemeIndex;
  final void Function(int) onThemeChanged;
  final bool isDarkMode;
  final void Function(bool) onDarkModeChanged;

  const SettingsPage({
    super.key,
    required this.title,
    required this.selectedThemeIndex,
    required this.onThemeChanged,
    required this.isDarkMode,
    required this.onDarkModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final themeNames = isDarkMode ? darkThemes : lightThemes;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      // Crea una lista de temas disponibles
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Elegir tema'),
            subtitle: Text('Selecciona entre los temas disponibles'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child:Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(themeNames.length, (index) {
                  final theme = themeNames[index];
                  final customColors = theme.extension<CustomColors>()!;
                  final background = theme.colorScheme.background;
                  final foreground = theme.colorScheme.onSurface;
                  final auxiliary = theme.colorScheme.secondary;
                  final button = customColors.buttonBackground;
                  return GestureDetector(
                    onTap:() => onThemeChanged(index),
                    child: Container(
                      width: 200,
                      height: 80,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedThemeIndex == index ? theme.colorScheme.secondary : Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: background,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(height: 10, width: 100, color: button),
                          Container(height: 10, width: 100, color: auxiliary),
                          Container(height: 10, width: 100, color: foreground),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          // Interruptor para el modo oscuro
          SwitchListTile(
            title: Text('Modo oscuro'),
            subtitle: Text(isDarkMode ? 'Activado' : 'Desactivado'),
            secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            value: isDarkMode,
            onChanged: onDarkModeChanged,
          ),
          // Información de la aplicación
          const AboutListTile(
            icon: Icon(Icons.info),
            applicationName: 'Calculadora',
            applicationVersion: '1.0.0',
            applicationIcon: Icon(Icons.calculate),
            aboutBoxChildren: [
              Text('Desarrollado por Daniel Landero Arias.'),
              Text('Esta aplicación fue creada como un proyecto de aprendizaje.'),
            ],
          ),
        ],
      ),
    );
  }
}
