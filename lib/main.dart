import 'package:flutter/material.dart';
import 'package:calculadora/themes/theme.dart';
import 'package:calculadora/pages/calculadora_page.dart';
import 'package:calculadora/pages/settings_page.dart';

final selectedThemeNotifier = ValueNotifier<int>(0);
final isDarkModeNotifier = ValueNotifier<bool>(false);  

// Selección del tema actual según el modo oscuro
ThemeData get currentTheme =>
    isDarkModeNotifier.value
        ? darkThemes[selectedThemeNotifier.value]
        : lightThemes[selectedThemeNotifier.value];

//Metodo principal de la aplicación
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// Construye la aplicación principal
  @override
  Widget build(BuildContext context) {
    // Escucha los cambios en el modo oscuro y el tema seleccionado
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, _) {
        // Obtiene el tema actual según el modo oscuro
        return ValueListenableBuilder<int>(
          valueListenable: selectedThemeNotifier,
          builder: (context, themeIndex, _) {
            // Construye la aplicación con el tema actual
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: currentTheme,
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

// Inicializa el estado de la página
  void _onThemeChanged(int index) {
    selectedThemeNotifier.value = index;
  }

// Cambia el modo oscuro de la aplicación
  void _onDarkModeChanged(bool isDark) {
    isDarkModeNotifier.value = isDark;
  }

// Cambia la página seleccionada en la barra de navegación
  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (_selectedIndex) {
        case 0:
        page = CalculadoraPage(
          title: 'Calculadora',
          onThemeChanged: _onThemeChanged,
          selectedThemeIndex: selectedThemeNotifier.value,
        );
        break;
      case 1:
        page = SettingsPage(
          title: 'Configuración',
          selectedThemeIndex: selectedThemeNotifier.value,
          onThemeChanged: _onThemeChanged,
          isDarkMode: isDarkModeNotifier.value,
          onDarkModeChanged: _onDarkModeChanged,
        );
        break;
      default:
        page = const Center(child: Text('Página no encontrada'));
    }

    return Scaffold(
      body: SafeArea(child: page),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Theme.of(context).colorScheme.primary,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onNavTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.calculate), label: 'Calculadora'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Configuración'),
        ],
      ),
    );
  }
}
