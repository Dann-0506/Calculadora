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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                child: Text(
                  _controller.expression,
                  style: const TextStyle(color: AppTheme.textColor, fontSize: 64),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(height: 10),
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
                    value: '0',
                    isWide: true,
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
