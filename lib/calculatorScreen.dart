import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_calculator/calculatorProvider.dart';
import 'package:my_calculator/main.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(FontAwesomeIcons.history, color: Colors.white, size: 20.sp),
                    SizedBox(width: 10.w),
                    Icon(Icons.square_foot, color: Colors.white, size: 25.sp),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.backspace , color: Colors.white, size: 20.sp)),
              ],
            ),
          ),
          Container(
            height: 15.h,
            width: 330.w,
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
              buildButton(context, '7', Colors.white),
              buildButton(context, '8', Colors.white),
              buildButton(context, '9', Colors.white),
              buildButton(context, '/', Colors.lightGreenAccent),
              buildButton(context, '4', Colors.white),
              buildButton(context, '5', Colors.white),
              buildButton(context, '6', Colors.white),
              buildButton(context, 'x', Colors.lightGreenAccent),
              buildButton(context, '1', Colors.white),
              buildButton(context, '2', Colors.white),
              buildButton(context, '3', Colors.white),
              buildButton(context, '-', Colors.lightGreenAccent),
              buildButton(context, 'C', Colors.blue),
              buildButton(context, '0', Colors.white),
              buildButton(context, '=', Colors.lightGreenAccent),
              buildButton(context, '+', Colors.lightGreenAccent),
            ],
          )
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, String label, Color fontColor) {

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
            style: TextStyle(
              color: fontColor,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );

  }
}
