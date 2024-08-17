String formattingValue(double max, double min, dynamic actualValue) {
  double realValue =
      ((max - min) * ((actualValue as double) - (actualValue.truncate()))) + min;
  return realValue.toStringAsFixed(2);
}
