import 'package:flutter/material.dart';
import 'package:my_calculator/calculatorProvider.dart';
import 'package:provider/provider.dart';

class Calculatorscreen extends StatefulWidget {
  const Calculatorscreen({super.key});

  @override
  State<Calculatorscreen> createState() => _CalculatorscreenState();
}

class _CalculatorscreenState extends State<Calculatorscreen> {
  @override
  Widget build(BuildContext context) {

    var calculator = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                calculator.display,
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 330,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            children: [
              buildButton(context, '7'),
              buildButton(context, '8'),
              buildButton(context, '9'),
              buildButton(context, '/'),
              buildButton(context, '4'),
              buildButton(context, '5'),
              buildButton(context, '6'),
              buildButton(context, '*'),
              buildButton(context, '1'),
              buildButton(context, '2'),
              buildButton(context, '3'),
              buildButton(context, '-'),
              buildButton(context, 'C'),
              buildButton(context, '0'),
              buildButton(context, '='),
              buildButton(context, '+'),
            ],
          )
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, String label) {

    var calculator = Provider.of<CalculatorProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        if (label == 'C') {
          calculator.clear();
        } else if (label == '=') {
          calculator.calculate();
        } else if (['+', '-', '*', '/', 'sin', 'cos', 'tan'].contains(label)) {
          calculator.inputOperator(label);
        } else {
          calculator.inputNumber(label);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );

  }
}
