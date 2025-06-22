import 'package:calculadora/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/pages/calculadora_page.dart';
import 'package:calculadora/pages/settings_page.dart';
import 'package:provider/provider.dart';

//Metodo principal de la aplicación
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// Construye la aplicación principal
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Calculadora',
          theme: themeProvider.currentTheme,
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
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
        page = CalculadoraPage();
        break;
      case 1:
        page = SettingsPage();
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
          NavigationDestination(icon: Icon(Icons.calculate), label: 'Modo Básico'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Configuración'),
        ],
      ),
    );
  }
}
