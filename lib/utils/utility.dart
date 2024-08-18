import 'dart:developer';

double riskScoreValue = 0;

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

int determineTieLine(double probability, double exposure) {
  if (probability >= 10) {
    if (exposure < 1) {
      return 1;
    } else {
      return 0;
    }
  } else if (probability >= 6) {
    if (exposure < 2) {
      return 1;
    } else {
      return 0;
    }
  } else if (probability >= 2) {
    if (exposure < 1) {
      return 2;
    } else if (exposure < 3) {
      return 1;
    } else {
      return 0;
    }
  } else if (probability >= 1) {
    if (exposure < 1) {
      return 3;
    } else if (exposure < 2) {
      return 2;
    } else if (exposure < 6) {
      return 1;
    } else {
      return 0;
    }
  } else if (probability >= 0.5) {
    if (exposure < 1) {
      return 4;
    } else if (exposure < 2) {
      return 3;
    } else if (exposure < 3) {
      return 2;
    } else if (exposure < 10) {
      return 1;
    } else {
      return 0;
    }
  } else if (probability >= 0.1) {
    if (exposure < 2) {
      return 4;
    } else if (exposure < 3) {
      return 3;
    } else if (exposure < 6) {
      return 2;
    } else {
      return 1;
    }
  }

  return 0;
}

String calculateRiskLevel(double riskScore) {
  if (riskScore > 400) {
    return 'Very High Risk - Sangat berbahaya, tindakan harus segera diambil';
  } else if (riskScore >= 200 && riskScore <= 400) {
    return 'High Risk - Risiko tinggi, perlu perhatian serius';
  } else if (riskScore >= 70 && riskScore < 200) {
    return 'Substantial Risk - Risiko signifikan, perlu pengendalian';
  } else if (riskScore >= 20 && riskScore < 70) {
    return 'Moderate Risk - Risiko sedang, pemantauan diperlukan';
  } else {
    return 'Low Risk - Risiko Rendah, dapat diterima';
  }
}

int calculateRiskSliderValue(
    double probability, double exposure, double consequence) {
  double riskScore = probability * exposure * consequence;
  riskScoreValue = riskScore;
  // log('Risk Score : $riskScore');

  if (riskScore > 400) {
    return 4;
  } else if (riskScore >= 200 && riskScore <= 400) {
    return 3;
  } else if (riskScore >= 70 && riskScore < 200) {
    return 2;
  } else if (riskScore >= 20 && riskScore < 70) {
    return 1;
  } else {
    return 0;
  }
}

double calculateRiskScore(
    double probability, double exposure, double consequence) {
  double riskScore = probability * exposure * consequence;
  return riskScore;
}
