import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  String _output = "0";
  String _outputHistory = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  String get output => _output;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _outputHistory = "";
      _num1 = 0;
      _num2 = 0;
      _operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷") {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _outputHistory += "$_num1 $_operand ";
      _output = "0";
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);
      if (_operand == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operand == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operand == "×") {
        _output = (_num1 * _num2).toString();
      } else if (_operand == "÷") {
        _output = (_num1 / _num2).toString();
      } else if (_operand == "%") {
        _output = (_num1 % _num2).toString();
      }
      _outputHistory += "$_num2 = $_output\n";
      _operand = "";
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }
    notifyListeners();
  }
}
