import 'package:flutter/material.dart';
import 'package:calculadora/themes/theme.dart';
import 'package:calculadora/pages/calculadora_page.dart';
import 'package:calculadora/pages/settings_page.dart';

final selectedThemeNotifier = ValueNotifier<int>(0);
final isDarkModeNotifier = ValueNotifier<bool>(false);  

ThemeData get currentTheme =>
    isDarkModeNotifier.value
        ? darkThemes[selectedThemeNotifier.value]
        : lightThemes[selectedThemeNotifier.value];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, _) {
        return ValueListenableBuilder<int>(
          valueListenable: selectedThemeNotifier,
          builder: (context, themeIndex, _) {
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

  void _onThemeChanged(int index) {
    selectedThemeNotifier.value = index;
  }

  void _onDarkModeChanged(bool isDark) {
    isDarkModeNotifier.value = isDark;
  }

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
