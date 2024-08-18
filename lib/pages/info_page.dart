import 'package:calculator_risk/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as md;

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        elevation: 1,
      ),
      body: const Center(
        child: md.Markdown(selectable: true, data: infoMarkDown),
      ),
    );
  }
}
