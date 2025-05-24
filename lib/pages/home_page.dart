import 'package:flutter/material.dart';
import 'package:calculadora/widgets/button.dart';
import 'package:calculadora/logic/calculator_controller.dart';
import 'package:calculadora/themes/theme.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key, required this.title});
  final String title;

  @override
  State<CalculadoraPage> createState() => _CalculadoraPage();
}

class _CalculadoraPage extends State<CalculadoraPage> {
  final CalculatorController _controller = CalculatorController();
  
  void _onButtonPressed(String value) {
    setState(() {
      _controller.onButtonPressed(value);
      _controller.updatePreview();
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
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
                  style: const TextStyle(color: AppTheme.textColor, fontSize: 24),
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
                    style: const TextStyle(color: AppTheme.textColor, fontSize: 64),
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
                    color: AppTheme.secondaryColor,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '+/-',
                    color: AppTheme.secondaryColor,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '%',
                    color: AppTheme.secondaryColor,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '÷',
                    color: AppTheme.operatorColor,
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
                    color: AppTheme.operatorColor,
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
                    color: AppTheme.operatorColor,
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
                    color: AppTheme.operatorColor,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Button(
                    value: '⌫',
                    color: AppTheme.secondaryColor,
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
                    color: AppTheme.operatorColor,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}