String formattingValueProbability(dynamic actualValue) {
  double max, min, realValue;

  if (actualValue < 1) {
    max = 0.5;
    min = 0.1;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 2) {
    max = 1;
    min = 0.5;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 3) {
    max = 2;
    min = 1;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 4) {
    max = 6;
    min = 2;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 5) {
    max = 10;
    min = 6;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else {
    realValue = 10;
  }
  return realValue.toStringAsFixed(2);
}

double reverseValueProbability(double realValue) {
  double max, min, sliderValue;

  if (realValue < 0.5) {
    max = 0.5;
    min = 0.1;
    sliderValue = (realValue - min) / (max - min);
  } else if (realValue < 1) {
    max = 1;
    min = 0.5;
    sliderValue = ((realValue - min) / (max - min)) + 1;
  } else if (realValue < 2) {
    max = 2;
    min = 1;
    sliderValue = ((realValue - min) / (max - min)) + 2;
  } else if (realValue < 6) {
    max = 6;
    min = 2;
    sliderValue = ((realValue - min) / (max - min)) + 3;
  } else if (realValue < 10) {
    max = 10;
    min = 6;
    sliderValue = ((realValue - min) / (max - min)) + 4;
  } else {
    sliderValue = 5;
  }
  return sliderValue;
}

String formattingValueExposure(dynamic actualValue) {
  double max, min, realValue;

  if (actualValue < 1) {
    max = 1;
    min = 0.5;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 2) {
    max = 2;
    min = 1;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 3) {
    max = 3;
    min = 2;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 4) {
    max = 6;
    min = 3;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 5) {
    max = 10;
    min = 6;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else {
    realValue = 10;
  }
  return realValue.toStringAsFixed(2);
}

double reverseValueExposure(double realValue) {
  double max, min, sliderValue;

  if (realValue < 1) {
    max = 1;
    min = 0.5;
    sliderValue = (realValue - min) / (max - min);
  } else if (realValue < 1) {
    max = 2;
    min = 1;
    sliderValue = ((realValue - min) / (max - min)) + 1;
  } else if (realValue < 2) {
    max = 3;
    min = 2;
    sliderValue = ((realValue - min) / (max - min)) + 2;
  } else if (realValue < 6) {
    max = 6;
    min = 3;
    sliderValue = ((realValue - min) / (max - min)) + 3;
  } else if (realValue < 10) {
    max = 10;
    min = 6;
    sliderValue = ((realValue - min) / (max - min)) + 4;
  } else {
    sliderValue = 5;
  }
  return sliderValue;
}

String formattingValueConsequence(dynamic actualValue) {
  double max, min, realValue;

  if (actualValue < 1) {
    max = 3;
    min = 1;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 2) {
    max = 7;
    min = 3;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 3) {
    max = 15;
    min = 7;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 4) {
    max = 40;
    min = 15;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else if (actualValue < 5) {
    max = 100;
    min = 40;
    realValue =
        ((max - min) * ((actualValue as double) - (actualValue.truncate()))) +
            min;
  } else {
    realValue = 100;
  }
  return realValue.toStringAsFixed(2);
}

double reverseValueConsequence(double realValue) {
  double max, min, sliderValue;

  if (realValue < 1) {
    max = 3;
    min = 1;
    sliderValue = (realValue - min) / (max - min);
  } else if (realValue < 1) {
    max = 7;
    min = 3;
    sliderValue = ((realValue - min) / (max - min)) + 1;
  } else if (realValue < 2) {
    max = 15;
    min = 7;
    sliderValue = ((realValue - min) / (max - min)) + 2;
  } else if (realValue < 6) {
    max = 40;
    min = 15;
    sliderValue = ((realValue - min) / (max - min)) + 3;
  } else if (realValue < 10) {
    max = 100;
    min = 40;
    sliderValue = ((realValue - min) / (max - min)) + 4;
  } else {
    sliderValue = 5;
  }
  return sliderValue;
}
