// Define the Calculator StatefulWidget
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

// The existing _CalculatorState class
class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _outputHistory = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  void _buttonPressed(String buttonText) {
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
    setState(() {
      _output;
      _outputHistory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RadicalStart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 700,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Table(
                              children: [
                                TableRow(
                                  children: [
                                    _buildButton(
                                        "C",
                                        const Color.fromARGB(
                                            255, 216, 209, 209),
                                        Colors.black),
                                    _buildButton(
                                        "÷",
                                        const Color.fromARGB(
                                            255, 216, 209, 209),
                                        Colors.black),
                                    _buildButton(
                                        "%",
                                        const Color.fromARGB(
                                            255, 216, 209, 209),
                                        Colors.black),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _buildButton(
                                        "7",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                    _buildButton(
                                        "8",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                    _buildButton(
                                        "9",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _buildButton(
                                        "4",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                    _buildButton(
                                        "5",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                    _buildButton(
                                        "6",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _buildButton(
                                        "1",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                    _buildButton(
                                        "2",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                    _buildButton(
                                        "3",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _buildButton(
                                        ".",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                    _buildButton(
                                        "0",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                    _buildButton(
                                        "00",
                                        const Color.fromARGB(
                                            255, 223, 230, 243),
                                        Colors.black),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Table(
                              children: [
                                TableRow(
                                  children: [
                                    _buildButton(
                                        "/", Colors.orange, Colors.white),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _buildButton(
                                        "×", Colors.orange, Colors.white),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _buildButton(
                                        "-", Colors.orange, Colors.white),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _buildButton(
                                        "+", Colors.orange, Colors.white),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _buildButton(
                                        "=", Colors.blue, Colors.white),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: 130,
                          width: 330,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 216, 209, 209),
                              borderRadius: BorderRadius.circular(30)),
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _output,
                              style: const TextStyle(
                                  fontSize: 48.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // buttonPressed(buttonText),
  Widget _buildButton(String buttonText, Color buttonColor, Color textColor) {
    return InkWell(
      onTap: () {
        _buttonPressed(buttonText);
      },
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonColor,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 30, color: textColor),
              ),
            )),
      ),
    );
  }
}
