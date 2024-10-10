import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_calculator/calculatorProvider.dart';
import 'package:my_calculator/calculatorScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      child: ChangeNotifierProvider(
        create: (_) => CalculatorProvider(),
        child: const MaterialApp(
          title: 'Calculator',
          debugShowCheckedModeBanner: false,
          home: Calculatorscreen(),
        ),
      ),
    );
  }
}
