import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CalculatorProvider.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
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
                      child: Consumer<CalculatorProvider>(
                        builder: (context, calculatorProvider, child) {
                          return Column(
                            children: [
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    child: Table(
                                      children: [
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                "C",
                                                const Color.fromARGB(
                                                    255, 216, 209, 209),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "÷",
                                                const Color.fromARGB(
                                                    255, 216, 209, 209),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "%",
                                                const Color.fromARGB(
                                                    255, 216, 209, 209),
                                                Colors.black,
                                                calculatorProvider),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                "7",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "8",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "9",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                "4",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "5",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "6",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                "1",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "2",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "3",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                ".",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "0",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                            _buildButton(
                                                "00",
                                                const Color.fromARGB(
                                                    255, 223, 230, 243),
                                                Colors.black,
                                                calculatorProvider),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Table(
                                      children: [
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                "/",
                                                Colors.orange,
                                                Colors.white,
                                                calculatorProvider),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                "×",
                                                Colors.orange,
                                                Colors.white,
                                                calculatorProvider),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                "-",
                                                Colors.orange,
                                                Colors.white,
                                                calculatorProvider),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                "+",
                                                Colors.orange,
                                                Colors.white,
                                                calculatorProvider),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            _buildButton(
                                                "=",
                                                Colors.blue,
                                                Colors.white,
                                                calculatorProvider),
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
                                      color: const Color.fromARGB(
                                          255, 216, 209, 209),
                                      borderRadius: BorderRadius.circular(30)),
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      calculatorProvider.output,
                                      style: const TextStyle(
                                          fontSize: 48.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText, Color buttonColor, Color textColor,
      CalculatorProvider provider) {
    return InkWell(
      onTap: () {
        provider.buttonPressed(buttonText);
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
