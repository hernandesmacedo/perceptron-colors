import 'dart:math';

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

List<num> red = [1.0, -1.0, -1.0];
List<num> green = [-1.0, 1.0, -1.0];
List<num> blue = [-1.0, -1.0, 1.0];
List<num> black = [-1.0, -1.0, -1.0];
List<num> white = [1.0, 1.0, 1.0];
List<num> yellow = [1.0, 1.0, -1.0];
List<num> magenta = [1.0, -1.0, 1.0];
List<num> cyan = [-1.0, 1.0, 1.0];

List<List<num>> x = [
  red,
  green,
  blue,
  black,
  white,
  yellow,
  magenta,
  cyan,
];

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

int bias = 1;

double learningRate = 0.015;

num yp = 0;

num error = 0;

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

double operate(List<num> input, List<num> weigth) {
  double sum = 0;
  for (int i = 0; i < input.length; i++) {
    sum += input[i] * weigth[i];
  }
  return sum;
}

String getColorName(List<num> inputColorValue) {
  inputColorValue = normalize(inputColorValue);

  List<num> outputResultColor = [];
  for (int neuron = 0; neuron < w.length; neuron++) {
    outputResultColor.add(operate(inputColorValue, w[neuron]));
  }
  int winnerTakesAll = outputResultColor.indexOf(outputResultColor.reduce(max));
  return colorNames[winnerTakesAll];
}

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
