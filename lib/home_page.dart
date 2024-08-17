import 'dart:developer';
import 'package:calculator_risk/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _sliderValueProbability = 0;
  double _sliderValueExposure = 0;
  double _sliderValueConsequence = 0;

  int _valueTieLine = 0;
  int _valueRiskSlider = 0;

  TextEditingController? probabilityController;
  TextEditingController? exposureController;
  TextEditingController? consequenceController;

  @override
  void initState() {
    probabilityController = TextEditingController();
    exposureController = TextEditingController();
    consequenceController = TextEditingController();
    probabilityController!.text = '0.10';
    exposureController!.text = '0.5';
    consequenceController!.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    probabilityController!.dispose();
    exposureController!.dispose();
    consequenceController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Risk Score Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            // Probability Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Probability",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SfSliderTheme(
                            data: const SfSliderThemeData(
                              activeLabelStyle: TextStyle(fontSize: 10),
                              inactiveLabelStyle: TextStyle(fontSize: 10),
                              tooltipTextStyle: TextStyle(fontSize: 10),
                            ),
                            child: SfSlider.vertical(
                              min: 0.0,
                              max: 5.0,
                              interval: 1.0,
                              value: _sliderValueProbability,

                              tooltipPosition: SliderTooltipPosition.right,
                              showDividers: true,
                              showTicks: true,
                              showLabels: true,
                              enableTooltip: true,
                              labelFormatterCallback:
                                  (dynamic actualValue, String formattedText) {
                                switch (actualValue) {
                                  case 0:
                                    return 'Practically Impossible';
                                  case 1:
                                    return 'Conceivable';
                                  case 2:
                                    return 'Remotely Possible';
                                  case 3:
                                    return 'Unusual but Possible';
                                  case 4:
                                    return 'Quite Possible';
                                  case 5:
                                    return 'Almost Certain';
                                }
                                return actualValue.toString();
                              },
                              tooltipTextFormatterCallback:
                                  (actualValue, formattedText) {
                                return formattingValueProbability(actualValue);
                              },

                              // minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _sliderValueProbability = value;
                                  probabilityController!.text =
                                      formattingValueProbability(value)
                                          .toString();
                                  _valueTieLine = determineTieLine(
                                      double.parse(probabilityController!.text),
                                      double.parse(exposureController!.text));
                                  _valueRiskSlider = calculateRiskSliderValue(
                                    double.parse(probabilityController!.text),
                                    double.parse(exposureController!.text),
                                    double.parse(consequenceController!.text),
                                  );
                                  log('value : $_sliderValueProbability');
                                  log('value TL : $_valueTieLine');
                                  log('value RS : $_valueRiskSlider');
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: probabilityController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9.]")),
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                final text = newValue.text;
                                return text.isEmpty
                                    ? newValue
                                    : double.tryParse(text) == null
                                        ? oldValue
                                        : newValue;
                              }),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input Nilai Probability!';
                              }

                              if (double.parse(value) < 0.1 ||
                                  double.parse(value) > 10) {
                                return 'Input antara 0.1 - 10';
                              }
                              return null;
                            },
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty &&
                                    double.parse(value) >= 0.1 &&
                                    double.parse(value) <= 10) {
                                  _sliderValueProbability =
                                      reverseValueProbability(
                                          double.parse(value));
                                  _valueTieLine = determineTieLine(
                                      double.parse(probabilityController!.text),
                                      double.parse(exposureController!.text));
                                  _valueRiskSlider = calculateRiskSliderValue(
                                    double.parse(probabilityController!.text),
                                    double.parse(exposureController!.text),
                                    double.parse(consequenceController!.text),
                                  );
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Exposure Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Exposure",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SfSliderTheme(
                            data: const SfSliderThemeData(
                              activeLabelStyle: TextStyle(fontSize: 10),
                              inactiveLabelStyle: TextStyle(fontSize: 10),
                              tooltipTextStyle: TextStyle(fontSize: 10),
                            ),
                            child: SfSlider.vertical(
                              min: 0.0,
                              max: 5.0,
                              interval: 1.0,
                              value: _sliderValueExposure,
                              tooltipPosition: SliderTooltipPosition.right,
                              showDividers: true,
                              showTicks: true,
                              showLabels: true,
                              enableTooltip: true,
                              labelFormatterCallback:
                                  (dynamic actualValue, String formattedText) {
                                switch (actualValue) {
                                  case 0:
                                    return 'Very Rare ';
                                  case 1:
                                    return 'Rare';
                                  case 2:
                                    return 'Infrequent';
                                  case 3:
                                    return 'Occasional';
                                  case 4:
                                    return 'Frequent';
                                  case 5:
                                    return 'Continuous';
                                }
                                return actualValue.toString();
                              },
                              tooltipTextFormatterCallback:
                                  (actualValue, formattedText) {
                                return formattingValueExposure(actualValue);
                              },
                              onChanged: (dynamic value) {
                                setState(() {
                                  _sliderValueExposure = value;
                                  exposureController!.text =
                                      formattingValueExposure(value).toString();
                                  _valueTieLine = determineTieLine(
                                      double.parse(probabilityController!.text),
                                      double.parse(exposureController!.text));
                                  _valueRiskSlider = calculateRiskSliderValue(
                                    double.parse(probabilityController!.text),
                                    double.parse(exposureController!.text),
                                    double.parse(consequenceController!.text),
                                  );
                                  log('value E: $_sliderValueExposure');
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: exposureController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9.]")),
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                final text = newValue.text;
                                return text.isEmpty
                                    ? newValue
                                    : double.tryParse(text) == null
                                        ? oldValue
                                        : newValue;
                              }),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input Nilai Exposure!';
                              }

                              if (double.parse(value) < 0.5 ||
                                  double.parse(value) > 10) {
                                return 'Input antara 0.5 - 10';
                              }
                              return null;
                            },
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty &&
                                    double.parse(value) >= 0.5 &&
                                    double.parse(value) <= 10) {
                                  _sliderValueExposure =
                                      reverseValueProbability(
                                          double.parse(value));
                                  _valueTieLine = determineTieLine(
                                      double.parse(probabilityController!.text),
                                      double.parse(exposureController!.text));
                                  _valueRiskSlider = calculateRiskSliderValue(
                                    double.parse(probabilityController!.text),
                                    double.parse(exposureController!.text),
                                    double.parse(consequenceController!.text),
                                  );
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Consequence Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Consequence",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SfSliderTheme(
                            data: const SfSliderThemeData(
                              activeLabelStyle: TextStyle(fontSize: 10),
                              inactiveLabelStyle: TextStyle(fontSize: 10),
                              tooltipTextStyle: TextStyle(fontSize: 10),
                            ),
                            child: SfSlider.vertical(
                              min: 0.0,
                              max: 5.0,
                              interval: 1.0,
                              value: _sliderValueConsequence,
                              tooltipPosition: SliderTooltipPosition.right,
                              showDividers: true,
                              showTicks: true,
                              showLabels: true,
                              enableTooltip: true,
                              labelFormatterCallback:
                                  (dynamic actualValue, String formattedText) {
                                switch (actualValue) {
                                  case 0:
                                    return 'Noticeable';
                                  case 1:
                                    return 'Important';
                                  case 2:
                                    return 'Serious';
                                  case 3:
                                    return 'Very Serious';
                                  case 4:
                                    return 'Disaster';
                                  case 5:
                                    return 'Catastrophe';
                                }
                                return actualValue.toString();
                              },
                              tooltipTextFormatterCallback:
                                  (actualValue, formattedText) {
                                return formattingValueConsequence(actualValue);
                              },
                              onChanged: (dynamic value) {
                                setState(() {
                                  _sliderValueConsequence = value;
                                  consequenceController!.text =
                                      formattingValueConsequence(value)
                                          .toString();
                                  _valueRiskSlider = calculateRiskSliderValue(
                                    double.parse(probabilityController!.text),
                                    double.parse(exposureController!.text),
                                    double.parse(consequenceController!.text),
                                  );
                                  log('value C: $_sliderValueConsequence');
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: consequenceController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9.]")),
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                final text = newValue.text;
                                return text.isEmpty
                                    ? newValue
                                    : double.tryParse(text) == null
                                        ? oldValue
                                        : newValue;
                              }),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input Nilai Consequence!';
                              }

                              if (double.parse(value) < 1 ||
                                  double.parse(value) > 100) {
                                return 'Input antara 1 - 100';
                              }
                              return null;
                            },
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (value) {
                              setState(() {
                                if (value.isNotEmpty &&
                                    double.parse(value) >= 1 &&
                                    double.parse(value) <= 100) {
                                  _sliderValueConsequence =
                                      reverseValueConsequence(
                                          double.parse(value));
                                  _valueRiskSlider = calculateRiskSliderValue(
                                    double.parse(probabilityController!.text),
                                    double.parse(exposureController!.text),
                                    double.parse(consequenceController!.text),
                                  );
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Result Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Hasil",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Probability
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SfSlider.vertical(
                                min: 0.0,
                                max: 5.0,
                                interval: 1.0,
                                value: _sliderValueProbability,
                                tooltipPosition: SliderTooltipPosition.right,
                                showDividers: true,
                                showTicks: true,
                                enableTooltip: true,
                                tooltipTextFormatterCallback:
                                    (actualValue, formattedText) {
                                  switch (actualValue) {
                                    case < 1:
                                      return 'Practically Impossible';
                                    case < 2:
                                      return 'Conceivable';
                                    case < 3:
                                      return 'Remotely Possible';
                                    case < 4:
                                      return 'Unusual but Possible';
                                    case < 5:
                                      return 'Quite Possible';
                                    case 5:
                                      return 'Almost Certain';
                                  }
                                  return actualValue.toString();
                                },
                                onChanged: (dynamic value) {},
                              ),
                              const Text(
                                "Probability",
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        ),
                        // Exposure
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SfSlider.vertical(
                                min: 0.0,
                                max: 5.0,
                                interval: 1.0,
                                value: _sliderValueExposure,
                                tooltipPosition: SliderTooltipPosition.right,
                                showDividers: true,
                                showTicks: true,
                                enableTooltip: true,
                                tooltipTextFormatterCallback:
                                    (actualValue, formattedText) {
                                  switch (actualValue) {
                                    case < 1:
                                      return 'Very Rare';
                                    case < 2:
                                      return 'Rare';
                                    case < 3:
                                      return 'Infrequent';
                                    case < 4:
                                      return 'Occasional';
                                    case < 5:
                                      return 'Frequent';
                                    case 5:
                                      return 'Continuous';
                                  }
                                  return actualValue.toString();
                                },
                                onChanged: (dynamic value) {},
                              ),
                              const Text(
                                "Exposure",
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        ),
                        // Tie Line
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SfSlider.vertical(
                                min: 0.0,
                                max: 4.0,
                                interval: 1.0,
                                value: _valueTieLine,
                                tooltipPosition: SliderTooltipPosition.right,
                                showDividers: true,
                                showTicks: true,
                                enableTooltip: true,
                                tooltipTextFormatterCallback:
                                    (actualValue, formattedText) {
                                  switch (actualValue) {
                                    case < 1:
                                      return 'Risk';
                                    case < 2:
                                      return 'Moderate Risk';
                                    case < 3:
                                      return 'Subtantial Risk';
                                    case < 4:
                                      return 'High Risk';
                                    case 4:
                                      return 'Very High Risk';
                                  }
                                  return actualValue.toString();
                                },
                                onChanged: (dynamic value) {},
                              ),
                              const Text(
                                "Tie Line",
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        ),
                        // Result Consequence
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SfSlider.vertical(
                                min: 0.0,
                                max: 5.0,
                                interval: 1.0,
                                value: _sliderValueConsequence,
                                tooltipPosition: SliderTooltipPosition.right,
                                showDividers: true,
                                showTicks: true,
                                enableTooltip: true,
                                tooltipTextFormatterCallback:
                                    (actualValue, formattedText) {
                                  switch (actualValue) {
                                    case < 1:
                                      return 'Noticeable';
                                    case < 2:
                                      return 'Important';
                                    case < 3:
                                      return 'Serious';
                                    case < 4:
                                      return 'Very Serious';
                                    case < 5:
                                      return 'Disaster';
                                    case 5:
                                      return 'Catastrophe';
                                  }
                                  return actualValue.toString();
                                },
                                onChanged: (dynamic value) {},
                              ),
                              const Text(
                                "Consequence",
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        ),
                        // Result Risk Score
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SfSlider.vertical(
                                min: 0.0,
                                max: 4.0,
                                interval: 1.0,
                                value: _valueRiskSlider,
                                tooltipPosition: SliderTooltipPosition.right,
                                showDividers: true,
                                showTicks: true,
                                enableTooltip: true,
                                tooltipTextFormatterCallback:
                                    (actualValue, formattedText) {
                                  switch (actualValue) {
                                    case < 1:
                                      return 'Risk';
                                    case < 2:
                                      return 'Moderate Risk';
                                    case < 3:
                                      return 'Subtantial Risk';
                                    case < 4:
                                      return 'High Risk';
                                    case 4:
                                      return 'Very High Risk';
                                  }
                                  return actualValue.toString();
                                },
                                onChanged: (dynamic value) {},
                              ),
                              const Text(
                                "Risk Score",
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
