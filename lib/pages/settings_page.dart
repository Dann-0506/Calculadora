import 'package:calculadora/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:calculadora/widgets/preview_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final themeState = themeProvider.themeState;
    final themeNames = themeState.isDarkMode ? darkThemes : lightThemes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Elegir tema'),
            subtitle: Text('Selecciona entre los temas disponibles'),
          ),
          // Vista previa de temas
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: themeNames.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final theme = themeNames[index];
                final customColors = theme.extension<CustomColors>()!;
                final background = theme.colorScheme.surface;
                final auxiliary = customColors.auxiliaryColor;
                final button = customColors.buttonBackground;
                final operator = customColors.operatorColor;
                final text = customColors.textColor;

                return GestureDetector(
                  onTap: () {
                    themeProvider.setThemeIndex(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 120,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            themeState.selectedThemeIndex == index
                                ? auxiliary
                                : Colors.grey,
                        width: themeState.selectedThemeIndex == index ? 3 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: background,
                      boxShadow:
                          themeState.selectedThemeIndex == index
                              ? [
                                BoxShadow(
                                  color: auxiliary.withValues(alpha: 0.2),
                                  blurRadius: 8,
                                ),
                              ]
                              : [],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Simulación de pantalla de calculadora
                        Container(
                          height: 24,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.centerRight,
                          child: Text(
                            '123+456',
                            style: TextStyle(
                              color: text,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        // Simulación de botones
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PreviewButton(value: '7', color: button),
                            PreviewButton(value: '+', color: operator),
                            PreviewButton(value: '=', color: auxiliary),
                          ],
                        ),
                        // Nombre del tema
                        Text(
                          themesNames[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: auxiliary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SwitchListTile(
            title: const Text('Modo oscuro'),
            subtitle: Text(themeState.isDarkMode ? 'Activado' : 'Desactivado'),
            secondary: Icon(
              themeState.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            value: themeState.isDarkMode,
            onChanged: (isDark) {
              themeProvider.setDarkMode(isDark);
            },
          ),
          const AboutListTile(
            icon: Icon(Icons.info),
            applicationName: 'Calculadora',
            applicationVersion: '1.0.0',
            applicationIcon: Icon(Icons.calculate),
            aboutBoxChildren: [
              Text(
                'Esta aplicación fue creada como un proyecto de aprendizaje.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
