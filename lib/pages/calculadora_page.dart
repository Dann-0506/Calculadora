import 'package:calculadora/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/widgets/button.dart';
import 'package:calculadora/logic/calculator_controller.dart';

class CalculadoraPage extends StatefulWidget {

  const CalculadoraPage({super.key,});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPage();
}

class _CalculadoraPage extends State<CalculadoraPage> {
  final CalculatorController _controller = CalculatorController();

  @override
  void initState() {
    super.initState();
  }
  
  void _onButtonPressed(String value) {
    setState(() {
      _controller.onButtonPressed(value);
      _controller.updatePreview();
    });
  } 

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
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
                    color: customColors.auxiliaryColor,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '⌫',
                    color: customColors.auxiliaryColor,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '%',
                    color: customColors.auxiliaryColor,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '÷',
                    color: customColors.operatorColor,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Button(
                    value: '7',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '8',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '9',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '×',
                    color: customColors.operatorColor,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Button(
                    value: '4',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '5',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '6',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '-',
                    color: customColors.operatorColor,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Button(
                    value: '1',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '2',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '3',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '+',
                    color: customColors.operatorColor,
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Button(
                    value: '+/-',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '0',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '.',
                    color: customColors.buttonBackground,
                    onPressed: _onButtonPressed,
                  ),
                  Button(
                    value: '=',
                    color: customColors.operatorColor,
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
