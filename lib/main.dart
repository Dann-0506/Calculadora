import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculadora/pages/pages.dart';
import 'package:calculadora/providers/theme_provider.dart';

//Metodo principal de la aplicación
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
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
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _selectedIndex, children: appPages),
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Theme.of(context).colorScheme.primary,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onNavTapped,
        destinations: appDestinations,
      ),
    );
  }
}
