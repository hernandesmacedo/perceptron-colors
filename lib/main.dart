import 'package:flutter/material.dart';
import 'package:perceptron_colors/pages/home.dart';
import 'package:perceptron_colors/algorithm/perceptron.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    perceptronTraining(200);
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
