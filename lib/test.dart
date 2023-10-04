import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Map<String, dynamic> _chartData;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 1000,
          height: 700,
          child: SfCartesianChart(
            title: ChartTitle(text: 'AAPL - 2016'),
            legend: const Legend(isVisible: true),
            trackballBehavior: _trackballBehavior,
            series: <LineSeries>[
              LineSeries<ChartSampleData, String>(
                sortingOrder: SortingOrder.ascending,
                dataSource: _chartData['dataOfFisrtLine'],
                name: 'Actual',
                xValueMapper: (ChartSampleData sales, _) => sales.x,
                yValueMapper: (ChartSampleData sales, _) => sales.y,
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
              LineSeries<ChartSampleData, String>(
                sortingOrder: SortingOrder.ascending,
                dataSource: _chartData['dataOfSecondLine'],
                name: 'Planning',
                xValueMapper: (ChartSampleData sales, _) => sales.x,
                yValueMapper: (ChartSampleData sales, _) => sales.y,
                dataLabelSettings: DataLabelSettings(isVisible: true),
              )
            ],
            // primaryXAxis: DateTimeAxis(
            // ),

            primaryXAxis: CategoryAxis(
                // axisLabelFormatter: (dynamic value) {
                //   // Format the date to your desired format.
                //   final date = DateTime.parse(value);
                //   return ChartAxisLabel("DateFormat('MMM dd, yyyy').format(date).toString()", TextStyle(color: Colors.red));
                // },

                ),
          ),
        ),
      ),
    );
  }

  // List<ChartSampleData> getChartData() {
  //   return <ChartSampleData>[
  //     ChartSampleData(
  //       x: DateTime(2016, 01, 5),
  //       y: 700.19,
  //     ),
  //     ChartSampleData(
  //       x: DateTime(2016, 01, 6),
  //       y: 100.19,
  //     ),
  //     ChartSampleData(
  //       x: DateTime(2016, 01, 7),
  //       y: 325.19,
  //     ),
  //     ChartSampleData(
  //       x: DateTime(2016, 01, 8),
  //       y: 500.19,
  //     ),
  //     ChartSampleData(
  //       x: DateTime(2016, 01, 8),
  //       y: 450.19,
  //     ),
  //     ChartSampleData(
  //       x: DateTime(2016, 01, 9),
  //       y: 200.19,
  //     ),
  //   ];
  // }

  // List<ChartSampleData> getChartData() {
  //   List<Map<String, dynamic>> myData = [
  //     {
  //       "date": DateTime(2016, 01, 5),
  //       "value": 700,
  //     },
  //     {
  //       "date": DateTime(2016, 01, 6),
  //       "value": 500,
  //     },
  //     {
  //       "date": DateTime(2016, 01, 7),
  //       "value": 100,
  //     },
  //     {
  //       "date": DateTime(2016, 01, 8),
  //       "value": 400,
  //     },
  //     {
  //       "date": DateTime(2016, 01, 8),
  //       "value": 700,
  //     },
  //     {
  //       "date": DateTime(2016, 01, 9),
  //       "value": 300,
  //     },
  //   ];

  //   List<ChartSampleData> data = [];

  //   for (var item in myData) {
  //     ChartSampleData x = ChartSampleData(
  //         x: DateFormat('MMM dd, yyyy').format(item['date']).toString(),
  //         y: item['value']);
  //     data.add(x);
  //   }

  //   return data;
  // }


Map<String, dynamic> getChartData() {
    List<Map<String, dynamic>> fisrtMap = [
      {
        "date": DateTime(2016, 01, 5),
        "value": 700,
      },
      {
        "date": DateTime(2016, 01, 6),
        "value": 500,
      },
      {
        "date": DateTime(2016, 01, 7),
        "value": 100,
      },
      {
        "date": DateTime(2016, 01, 8),
        "value": 400,
      },
      {
        "date": DateTime(2016, 01, 8),
        "value": 700,
      },
      {
        "date": DateTime(2016, 01, 9),
        "value": 300,
      },
    ];

    List<Map<String, dynamic>> secondMap = [
      {
        "date": DateTime(2016, 01, 5),
        "value": 600,
      },
      
      {
        "date": DateTime(2016, 01, 9),
        "value": 450,
      },
    ];

    List<ChartSampleData> lineOne = [];
    List<ChartSampleData> lineTwo = [];


    for (var item in fisrtMap) {
      ChartSampleData pointData = ChartSampleData(
          x: DateFormat('MMM dd, yyyy').format(item['date']).toString(),
          y: item['value']);
      lineOne.add(pointData);
    }

    for (var item in secondMap) {
      ChartSampleData pointData = ChartSampleData(
          x: DateFormat('MMM dd, yyyy').format(item['date']).toString(),
          y: item['value']);
      lineTwo.add(pointData);
    }


    Map<String, dynamic> allData = {
      "dataOfFisrtLine" : lineOne,
      "dataOfSecondLine" : lineTwo,
    };

    return allData;
  }

}

// class ChartSampleData {
//   ChartSampleData({
//     this.x,
//     this.y,
//   });

//   final DateTime? x;
//   final num? y;
// }

class ChartSampleData {
  ChartSampleData({
    this.x,
    this.y,
  });

  final String? x;
  final num? y;
}
