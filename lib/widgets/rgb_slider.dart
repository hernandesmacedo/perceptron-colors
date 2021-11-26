import 'package:flutter/material.dart';

class RGBSlider extends StatelessWidget {
  const RGBSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final int min;
  final int max;
  final int value;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [min, max]
                .map(
                  (e) => Text(
                    e.toString(),
                    style: const TextStyle(
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            valueIndicatorColor: Colors.grey,
            thumbColor: Colors.grey,
            activeTrackColor: Colors.grey,
            inactiveTrackColor: Colors.grey,
          ),
          child: Slider(
            min: min.toDouble(),
            max: max.toDouble(),
            value: value.toDouble(),
            divisions: max,
            onChanged: onChanged,
            label: value.toString(),
          ),
        ),
      ],
    );
  }
}
