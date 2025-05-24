import 'package:math_expressions/math_expressions.dart';

class CalculatorController {
  bool _justEvaluated = false;
  String _expression = '';
  String previewResult = '';

  String get expression => _expression;

  // Método para manejar la lógica de los botones
  void onButtonPressed(String value) {
    if (value == 'AC') {
      _reset();
    } else if (value == '+/-') {
      _toggleSign();
    } else if (value == '⌫'){
      _deleteLast();
    } else if (value == '%') {
      _appendValue('%');
    } else if (value == '=') {
      _evaluateExpression();
    } else {
      _appendValue(value);
    }
  }

  // Método para alternar el signo del número actual
  void _toggleSign() {
    if (_expression.startsWith('-')) {
      _expression = _expression.substring(1);
    } else if (_expression != '0') {
      _expression = '-$_expression';
    }
  }

  // Método para evaluar la expresión actual
  void _evaluateExpression() {
    try {
      String formattedExpression = _expression;

      formattedExpression = formattedExpression.replaceAllMapped(
        RegExp(r'(\d+(\.\d+)?)(\s*[\+\-]\s*)(\d+(\.\d+)?)%'),
        (match) {
          final a = match.group(1);
          final op = match.group(3);
          final b = match.group(4);

          return '$a$op($a*$b/100)';
        },
      );

      formattedExpression = formattedExpression.replaceAllMapped(
        RegExp(r'(\d+(\.\d+)?)%'), 
        (match) => '(${match[1]}/100)',
      );

      formattedExpression = formattedExpression    
      .replaceAll('×', '*')
      .replaceAll('÷', '/');

      final result = _safeEval(formattedExpression);
      _expression = result.toString().replaceAll(RegExp(r'\.?0+$'), '');
      
      _justEvaluated = true;
    } catch (_) {
      _expression = 'Error';
    }
  }

  // Método para agregar un valor a la expresión actual
  void _appendValue(String value) {
    if (_justEvaluated && RegExp(r'\d').hasMatch(value)||_expression == '0' || _expression == 'Error') {
      _expression = value;
    } else {
      _expression += value;
    }
    _justEvaluated = false;
  }

  // Método para evaluar la expresión con math_expressions
  double _safeEval(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      return exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      throw Exception('Expresión inválida');
    }
  }

  // Método para reiniciar la expresión
  void _reset() {
    _expression = '';
  }

  // Método para eliminar el último carácter de la expresión
  void _deleteLast() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
  }

  // Método para actualizar la vista previa del resultado
  void updatePreview() {
    try {
      String preview = _expression;

      preview = preview.replaceAllMapped(
       RegExp(r'(\d+(\.\d+)?)(\s*[\+\-]\s*)(\d+(\.\d+)?)%'),
        (match) {
          final a = match.group(1);
          final op = match.group(3);
          final b = match.group(4);

          return '$a$op($a*$b/100)';
        },
      );

      preview = preview.replaceAllMapped(
        RegExp(r'(\d+(\.\d+)?)%'),
        (match) => '(${match[1]}/100)',
      );

      preview = preview.replaceAll('×', '*').replaceAll('÷', '/');

      final exp = Parser().parse(preview);
      final result = exp.evaluate(EvaluationType.REAL, ContextModel());

      previewResult = result.toString().replaceAll(RegExp(r'\.?0+$'), '');
    } catch (_) {
      previewResult = '';
    }
  }
}
