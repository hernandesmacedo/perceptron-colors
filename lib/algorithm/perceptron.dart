import 'dart:math';

/// Ordered list of color names
List<String> colorNames = [
  'Red',
  'Green',
  'Blue',
  'Black',
  'White',
  'Yellow',
  'Magenta',
  'Cyan',
];

/// Ordered list of color input values
List<List<num>> x = [
  [1.0, -1.0, -1.0],
  [-1.0, 1.0, -1.0],
  [-1.0, -1.0, 1.0],
  [-1.0, -1.0, -1.0],
  [1.0, 1.0, 1.0],
  [1.0, 1.0, -1.0],
  [1.0, -1.0, 1.0],
  [-1.0, 1.0, 1.0],
];

/// Ordered list of color output values
List<List<num>> y = [
  [1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0],
  [-1.0, 1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0],
  [-1.0, -1.0, 1.0, -1.0, -1.0, -1.0, -1.0, -1.0],
  [-1.0, -1.0, -1.0, 1.0, -1.0, -1.0, -1.0, -1.0],
  [-1.0, -1.0, -1.0, -1.0, 1.0, -1.0, -1.0, -1.0],
  [-1.0, -1.0, -1.0, -1.0, -1.0, 1.0, -1.0, -1.0],
  [-1.0, -1.0, -1.0, -1.0, -1.0, -1.0, 1.0, -1.0],
  [-1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, 1.0],
];

Random rand = Random();

/// Ordered list of neuron weight values.
///
/// `w[0]` represents the RGB weight values of the first neuron, which is red.
List<List<num>> w = [
  [rand.nextDouble(), rand.nextDouble(), rand.nextDouble()],
  [rand.nextDouble(), rand.nextDouble(), rand.nextDouble()],
  [rand.nextDouble(), rand.nextDouble(), rand.nextDouble()],
  [rand.nextDouble(), rand.nextDouble(), rand.nextDouble()],
  [rand.nextDouble(), rand.nextDouble(), rand.nextDouble()],
  [rand.nextDouble(), rand.nextDouble(), rand.nextDouble()],
  [rand.nextDouble(), rand.nextDouble(), rand.nextDouble()],
  [rand.nextDouble(), rand.nextDouble(), rand.nextDouble()],
];

/// Bias value
int bias = 1;

/// Learning rate value
double learningRate = 0.015;

/// Perceptron's output from a processed  input
num yp = 0;

/// Difference between real and classified output value
num error = 0;

/// Normalizes an input color to the [-1, 1] range.
///
/// Parameters:
/// - `color`: List containing RGB input values.
///
/// Returns:
/// - `color`: List containing RGB input values normalized to the [-1, 1] range.
List<num> normalize(List<num> color) {
  int minValue = 0;
  int denominator = 255;
  color[0] = (color[0] - minValue) / denominator;
  color[1] = (color[1] - minValue) / denominator;
  color[2] = (color[2] - minValue) / denominator;

  int newRange = 2;
  color[0] = (color[0] * newRange) - 1;
  color[1] = (color[1] * newRange) - 1;
  color[2] = (color[2] * newRange) - 1;

  return color;
}

/// Adds the multiplication of each input value in a list by its weight in a neuron.
///
/// Parameters:
/// - `input`: List containing RGB input values;
/// - `weigth`: List containing weight values of a neuron.
///
/// Returns:
/// - `sum`: double representing the sum of each RGB value multiplied by its weight.
double operate(List<num> input, List<num> weigth) {
  double sum = 0;
  for (int i = 0; i < input.length; i++) {
    sum += input[i] * weigth[i];
  }
  return sum;
}

/// Trains the perceptron for a number of `eras` by adjusting
/// the weights of each neuron (each one representing a color out of eight).
/// The adjustment is performed by classifying input values
/// and comparing the perceptron's output with the real result.
///
/// Parameters:
/// - `totalEra`: int defining the number of eras to be performed.
void perceptronTraining(int totalEra) {
  for (int era = 0; era < totalEra; era++) {
    for (int sample = 0; sample < x.length; sample++) {
      for (int neuron = 0; neuron < x.length; neuron++) {
        yp = operate(x[sample], w[neuron]) + bias;
        error = y[sample][neuron] - yp;
        w[neuron] = [
          w[neuron][0] + learningRate * error * x[sample][0],
          w[neuron][1] + learningRate * error * x[sample][1],
          w[neuron][2] + learningRate * error * x[sample][2],
        ];
      }
    }
  }
}

/// Gets a color name. The winner Takes All technique is performed here by
/// selecting the name of the color with the highest value in the `outputResultColor`.
///
/// Parameters:
/// - `inputColorValue`: List containing RGB input values.
///
/// Returns:
/// - a String representating the name of the color with the highest value in the `outputResultColor`.
String getColorName(List<num> inputColorValue) {
  inputColorValue = normalize(inputColorValue);

  List<num> outputResultColor = [];
  for (int neuron = 0; neuron < w.length; neuron++) {
    outputResultColor.add(operate(inputColorValue, w[neuron]));
  }
  int winnerTakesAll = outputResultColor.indexOf(outputResultColor.reduce(max));
  return colorNames[winnerTakesAll];
}
