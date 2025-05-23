import 'package:math_expressions/math_expressions.dart';

class CalculatorController {
  bool _justEvaluated = false;
  String _expression = '0';

  String get expression => _expression;

  void onButtonPressed(String value) {
    if (value == 'AC') {
      _expression = '0';
    } else if (value == '+/-') {
      _toggleSign();
    } else if (value == '%') {
      _applyPercent();
    } else if (value == '=') {
      _evaluateExpression();
    } else {
      _appendValue(value);
    }
  }

  void _toggleSign() {
    if (_expression.startsWith('-')) {
      _expression = _expression.substring(1);
    } else if (_expression != '0') {
      _expression = '-$_expression';
    }
  }

  void _applyPercent() {
    try {
      final value = double.parse(_expression);
      _expression = (value / 100).toString();
    } catch (_) {
      _expression = 'Error';
    }
  }

  void _evaluateExpression() {
    try {
      String formattedExpression = _expression
          .replaceAll('×', '*')
          .replaceAll('÷', '/');
      final result = _safeEval(formattedExpression);
      
      _expression = result.toString().replaceAll(RegExp(r'\.?0+$'), '');
      
      _justEvaluated = true;
    } catch (_) {
      _expression = 'Error';
    }
  }

  void _appendValue(String value) {
    if (_justEvaluated && RegExp(r'\d').hasMatch(value)||_expression == '0' || _expression == 'Error') {
      _expression = value;
    } else {
      _expression += value;
    }
    _justEvaluated = false;
  }

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

  void reset() {
    _expression = '0';
  }
}
