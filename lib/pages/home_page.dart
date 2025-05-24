import 'package:flutter/material.dart';
import 'package:calculadora/widgets/button.dart';
import 'package:calculadora/logic/calculator_controller.dart';

class CalculadoraPage extends StatefulWidget {
  final String title;
  final void Function(int) onThemeChanged;
  final int selectedThemeIndex;

  const CalculadoraPage({
    super.key,
    required this.title,
    required this.onThemeChanged, 
    required this.selectedThemeIndex,
  });

  @override
  State<CalculadoraPage> createState() => _CalculadoraPage();
}

class _CalculadoraPage extends State<CalculadoraPage> {
  final CalculatorController _controller = CalculatorController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedThemeIndex;
  }
  
  void _onButtonPressed(String value) {
    setState(() {
      _controller.onButtonPressed(value);
      _controller.updatePreview();
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Display del resultado previo
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  _controller.previewResult,
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
                  textAlign: TextAlign.right,
                ),
              ),
              // Display de la expresión actual
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: SelectableText(
                    _controller.expression,
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 64),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Botones de la calculadora
              Row(
                children: [
                  Button(
                    value: 'AC',
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '⌫',
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '%',
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '÷',
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Button(
                    value: '7',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '8',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '9',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '×',
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Button(
                    value: '4',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '5',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '6',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '-',
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Button(
                    value: '1',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '2',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '3',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '+',
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Button(
                    value: '+/-',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '0',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '.',
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '=',
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() => _selectedIndex = index);
          widget.onThemeChanged(index);
        },
        destinations: const [
          NavigationDestination(icon:Icon(Icons.water_drop), label: 'Azul'),
          NavigationDestination(icon: Icon(Icons.eco), label: 'Verde'),
          NavigationDestination(icon: Icon(Icons.wb_sunny), label: 'Amarillo'),
          NavigationDestination(icon: Icon(Icons.brightness_3), label: 'Morado'),
        ],
      ),
    );
  }
}