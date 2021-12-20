import 'package:flutter/material.dart';
import 'package:perceptron_colors/widgets/footer.dart';
import 'package:perceptron_colors/widgets/header.dart';
import 'package:perceptron_colors/widgets/rgb_slider.dart';
import 'package:perceptron_colors/algorithm/perceptron.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var colorsValue = {
    'red': 0,
    'green': 0,
    'blue': 0,
  };
  var colorName = 'Black';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final mainContainerSize = screenHeight * 0.65;
    final colorContainerSize = screenHeight * 0.1;
    final fontSize = screenHeight * 0.0361;
    final paddingSize = screenHeight * 0.0131;

    return Scaffold(
      appBar: const Header(),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: mainContainerSize,
            height: mainContainerSize,
            color: const Color(0xFFedfffd),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RGBSlider(
                  min: 0,
                  max: 255,
                  value: colorsValue['red']!,
                  onChanged: (value) {
                    onChange('red', value);
                  },
                ),
                RGBSlider(
                  min: 0,
                  max: 255,
                  value: colorsValue['green']!,
                  onChanged: (value) {
                    onChange('green', value);
                  },
                ),
                RGBSlider(
                  min: 0,
                  max: 255,
                  value: colorsValue['blue']!,
                  onChanged: (value) {
                    onChange('blue', value);
                  },
                ),
                Padding(padding: EdgeInsets.all(paddingSize)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: colorContainerSize,
                    width: colorContainerSize,
                    color: Color.fromRGBO(
                      colorsValue['red']!,
                      colorsValue['green']!,
                      colorsValue['blue']!,
                      1,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(paddingSize)),
                Text(
                  '[' +
                      colorsValue['red'].toString() +
                      ', ' +
                      colorsValue['green'].toString() +
                      ', ' +
                      colorsValue['blue'].toString() +
                      ']',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Calibri',
                    color: Colors.grey,
                  ),
                ),
                Padding(padding: EdgeInsets.all(paddingSize / 2)),
                Text(
                  colorName,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Calibri',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFd7fffb),
      bottomNavigationBar: const Footer(),
    );
  }

  void onChange(String color, double value) {
    setState(() {
      colorsValue[color] = value.toInt();
      colorName = getColorName(
        [colorsValue['red']!, colorsValue['green']!, colorsValue['blue']!],
      );
    });
  }
}
