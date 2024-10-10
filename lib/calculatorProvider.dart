import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorProvider with ChangeNotifier {
  String _display = '0';   // Calculator display text
  String _operand = '';    // Stores operand (like +, -, sin, cos, etc.)
  double _firstNumber = 0;

  String get display => _display;

  void inputNumber (String number) {
    if(_display == '0' || _operand.isNotEmpty) {
      _display = number;
    } else {
      _display = _display + number;
    }
    notifyListeners();
  }

  void inputOperator (String operator) {
    _firstNumber = double.parse(_display);
    _operand = operator;
    notifyListeners();
  }

  void calculate() {
    double secondNumber = double.parse(_display);
    double result = 0;

    switch (_operand) {
      case '+':
        result = _firstNumber + secondNumber;
        break;
      case '-':
        result = _firstNumber - secondNumber;
        break;
      case '*':
        result = _firstNumber * secondNumber;
        break;
      case '/':
        result = _firstNumber / secondNumber;
        break;
      case 'sin':
        result = sin(_firstNumber * pi / 180); // Convert to radians
        break;
      case 'tan':
        result = tan(_firstNumber * pi / 180); // Convert to radians
        break;
      case 'cos':
        result = cos(_firstNumber * pi / 180);
        break;
      default:
        result = secondNumber;
    }

    _display = result.toString();
    _operand = '';
    notifyListeners();

  }

  void clear() {
    _display = '0';
    _operand = '';
    _firstNumber = 0;
    notifyListeners();
  }

}