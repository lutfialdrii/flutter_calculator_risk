import 'dart:developer';

import 'package:calculator_risk/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Risk Score Calculator")),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          children: [
            Expanded(child: TextField()),
            Expanded(
              flex: 2,
              child: SfSlider.vertical(
                min: 0.0,
                max: 5.0,
                interval: 1.0,
                value: _value,
                showDividers: true,
                showTicks: true,
                showLabels: true,
                labelFormatterCallback: (dynamic actualValue, String formattedText) {
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
                tooltipTextFormatterCallback: (actualValue, formattedText) {
                  if (actualValue < 1) {
                    return formattingValue(0.5, 0.1, actualValue);
                  } else if (actualValue < 2) {
                    return formattingValue(1, 0.5, actualValue);
                  } else if (actualValue < 3) {
                    return formattingValue(2, 1, actualValue);
                  } else if (actualValue < 4) {
                    return formattingValue(6, 2, actualValue);
                  } else if (actualValue == 5) {
                    return '10';
                  } else {
                    return formattingValue(10, 6, actualValue);
                  }
                },
                enableTooltip: true,
              
                // minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                    log('value : $_value');
                  });
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
