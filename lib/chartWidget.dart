import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatelessWidget {
  final List<double> yValues = [
    10,
    20,
    15,
    30,
    25,
    10,
    7,
    9,
    23,
    6,
    40
  ]; // Replace with your data
  final List<String> xLabels = [
    "Day 1",
    "Day 2",
    "Day 3",
    "Day 4",
    "Day 5",
    "Day 6",
    "Day 7",
    "Day 8",
    "Day 9",
    "Day 10",
    "Day 11",
  ]; // Replace with your dates

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: true),
          titlesData: LineTitles.getTitleData(xLabels),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: const Color(0xff37434d),
              width: 1,
            ),
          ),
          // minX: 0,
          // maxX: xLabels.length.toDouble() - 1,
          minY: 0,
          maxY: yValues.reduce((a, b) => a > b ? a : b) +
              10, // Adjust the maxY based on your data

          lineBarsData: [
            LineChartBarData(
              spots: List.generate(yValues.length, (index) {
                return FlSpot(index.toDouble(), yValues[index]);
              }),
              isCurved: true,
              color: Colors.blue,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}

class LineTitles {
  static getTitleData(List<String> xLables) => FlTitlesData(
        show: true,
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: (value, meta) {
              // You can customize the x-axis labels here
              int index = value.toInt();
              if (index >= 0 && index < xLables.length) {
                return Text(xLables[index]);
              }
              return const Text('');
            },
            showTitles: true,
            reservedSize: 20.0,
            interval: 1,
          ),
        ),
      );
}
