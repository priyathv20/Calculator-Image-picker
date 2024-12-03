import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculatorGetx.dart';

class CalculatorGetx extends StatelessWidget {
  const CalculatorGetx({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = Get.put(CalculatorController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
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
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Table(
                                children: [
                                  TableRow(
                                    children: [
                                      _buildButton(
                                          "C",
                                          const Color.fromARGB(
                                              255, 216, 209, 209),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "÷",
                                          const Color.fromARGB(
                                              255, 216, 209, 209),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "%",
                                          const Color.fromARGB(
                                              255, 216, 209, 209),
                                          Colors.black,
                                          controller),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _buildButton(
                                          "7",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "8",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "9",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _buildButton(
                                          "4",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "5",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "6",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _buildButton(
                                          "1",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "2",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "3",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _buildButton(
                                          ".",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "0",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                      _buildButton(
                                          "00",
                                          const Color.fromARGB(
                                              255, 223, 230, 243),
                                          Colors.black,
                                          controller),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Table(
                                children: [
                                  TableRow(
                                    children: [
                                      _buildButton("/", Colors.orange,
                                          Colors.white, controller),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _buildButton("×", Colors.orange,
                                          Colors.white, controller),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _buildButton("-", Colors.orange,
                                          Colors.white, controller),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _buildButton("+", Colors.orange,
                                          Colors.white, controller),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      _buildButton("=", Colors.blue,
                                          Colors.white, controller),
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
                              child: Obx(() {
                                return Text(
                                  controller.output,
                                  style: const TextStyle(
                                      fontSize: 48.0,
                                      fontWeight: FontWeight.bold),
                                );
                              }),
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
      ),
    );
  }

  Widget _buildButton(String buttonText, Color buttonColor, Color textColor,
      CalculatorController controller) {
    return InkWell(
      onTap: () {
        controller.buttonPressed(buttonText);
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
