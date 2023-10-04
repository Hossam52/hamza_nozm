import 'package:flutter/material.dart';
import 'package:test/chartWidget.dart';
import 'package:test/sampleChart.dart';
import 'package:test/test.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("CHART"),
      ),
      body: MyHomePage(title: "New Chart" ), 
      // LineChartSample()
      // const LineChart1(isShowingMainData: true,),
    );
  }
}
