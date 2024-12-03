import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final _output = "0".obs;
  final _outputHistory = "".obs;
  double _num1 = 0;
  double _num2 = 0;
  final _operand = "".obs;

  String get output => _output.value;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output.value = "0";
      _outputHistory.value = "";
      _num1 = 0;
      _num2 = 0;
      _operand.value = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷") {
      _num1 = double.parse(_output.value);
      _operand.value = buttonText;
      _outputHistory.value += "$_num1 $_operand ";
      _output.value = "0";
    } else if (buttonText == "=") {
      _num2 = double.parse(_output.value);
      if (_operand.value == "+") {
        _output.value = (_num1 + _num2).toString();
      } else if (_operand.value == "-") {
        _output.value = (_num1 - _num2).toString();
      } else if (_operand.value == "×") {
        _output.value = (_num1 * _num2).toString();
      } else if (_operand.value == "÷") {
        _output.value = (_num1 / _num2).toString();
      } else if (_operand.value == "%") {
        _output.value = (_num1 % _num2).toString();
      }
      _outputHistory.value += "$_num2 = $_output\n";
      _operand.value = "";
    } else {
      if (_output.value == "0") {
        _output.value = buttonText;
      } else {
        _output.value += buttonText;
      }
    }
  }
}
