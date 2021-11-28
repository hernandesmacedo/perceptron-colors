import 'dart:math';

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

double operate(List<num> entry, List<num> weigth) {
  double sum = 0;
  for (int i = 0; i < entry.length; i++) {
    sum += entry[i] * weigth[i];
  }
  return sum;
}

List<String> colorsNames = [
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

int bias = 1;

double learning = 0.1;

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

num error = 0;

String getColorName(List<num> colorValue) {
  List<num> resultColor = [];
  print(colorValue);
  print(w);
  for (int neuro = 0; neuro < w.length; neuro++) {
    resultColor.add(operate(colorValue, w[neuro]));
  }
  int colorR = resultColor.indexOf(resultColor.reduce(max));
  return colorsNames[colorR];
}

num yr = 0;

void perceptronTrain(int epoca) {
  for (int i = 0; i < epoca; i++) {
    for (int amostra = 0; amostra < x.length; amostra++) {
      for (int neuro = 0; neuro < x.length; neuro++) {
        yr = operate(x[amostra], w[neuro]) + bias;
        error = y[amostra][neuro] - yr;
        w[neuro] = [
          w[neuro][0] + learning * error * x[amostra][0],
          w[neuro][1] + learning * error * x[amostra][1],
          w[neuro][2] + learning * error * x[amostra][2],
        ];
      }
    }
  }
}