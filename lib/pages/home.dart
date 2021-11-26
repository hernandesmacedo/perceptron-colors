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
      body: Center(
        child: Container(
          width: (MediaQuery.of(context).size.height) * 0.65,
          height: (MediaQuery.of(context).size.height) * 0.65,
          color: const Color(0xFFedfffd),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
      backgroundColor: const Color(0xFFd7fffb),
      bottomNavigationBar: const Footer(),
    );
  }
}
