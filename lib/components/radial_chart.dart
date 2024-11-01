import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartApp extends StatelessWidget {
  const ChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    final chartData = [
      ChartData('Low', 1500, Colors.pink),
      ChartData('Average', 3200, Colors.greenAccent),
      ChartData('High', 4500, Colors.yellow),
    ];

    return Scaffold(
        body: Center(
            child: SfCircularChart(series: <CircularSeries<ChartData, dynamic>>[
      RadialBarSeries(
          useSeriesColor: true,
          trackOpacity: 0.3,
          maximumValue: 6000,
          radius: '50%',
          innerRadius: '30%',
          gap: '10%',
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          xValueMapper: (ChartData data, _) => data.info,
          yValueMapper: (ChartData data, _) => data.value,
          pointColorMapper: (ChartData data, _) => data.color)
    ])));
  }
}

class ChartData {
  ChartData(this.info, this.value, this.color);
  final String info;
  final double value;
  final Color color;
}
