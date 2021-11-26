import 'package:flutter/material.dart';
import 'package:perceptron_colors/widgets/footer.dart';
import 'package:perceptron_colors/widgets/header.dart';
import 'package:perceptron_colors/widgets/rgb_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int rSliderValue = 0;
  int gSliderValue = 0;
  int bSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 5.0,
          runSpacing: 16.0,
          alignment: WrapAlignment.center,
          children: [
            RGBSlider(
              min: 0,
              max: 255,
              value: rSliderValue,
              onChanged: (value) {
                setState(() {
                  rSliderValue = value.toInt();
                });
              },
            ),
            RGBSlider(
              min: 0,
              max: 255,
              value: gSliderValue,
              onChanged: (value) {
                setState(() {
                  gSliderValue = value.toInt();
                });
              },
            ),
            RGBSlider(
              min: 0,
              max: 255,
              value: bSliderValue,
              onChanged: (value) {
                setState(() {
                  bSliderValue = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
