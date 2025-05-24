import 'package:flutter/material.dart';
import 'package:calculadora/pages/home_page.dart';
import 'package:calculadora/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedThemeIndex = 0;

  final List<ThemeData> _themes = [
    blueTheme,
    greenTheme,
    yellowTheme,
    purpleTheme,
  ];

  void _changeTheme(int index) {
    setState(() {
      _selectedThemeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: _themes[_selectedThemeIndex],
      home: CalculadoraPage(
        title: 'Calculadora',
        onThemeChanged: _changeTheme,
        selectedThemeIndex: _selectedThemeIndex,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
