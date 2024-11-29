import 'package:flutter/material.dart';
import 'package:trivia/models/chart.dart';
import 'package:trivia/providers/response.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Radial extends ConsumerWidget {
  const Radial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var scores = ref.watch(responseProvider.notifier).getScores();

    final double total = scores['total']!.toDouble();
    final int accurate = scores['accurate']!;
    final int inaccrurate = scores['inaccurate']!;

    final chartData = [
      ChartData('Inccurate', inaccrurate, Colors.pink),
      ChartData('Accurate', accurate, Colors.greenAccent),
    ];

    return SfCircularChart(series: <CircularSeries<ChartData, dynamic>>[
      RadialBarSeries(
          enableTooltip: true,
          useSeriesColor: true,
          // trackColor: const Color(0xFFFF9CBF),
          trackOpacity: 0.1,
          maximumValue: total,
          radius: '70%',
          innerRadius: '50%',
          gap: '10%',
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          xValueMapper: (ChartData data, _) => data.info,
          yValueMapper: (ChartData data, _) => data.value,
          pointColorMapper: (ChartData data, _) => data.color)
    ]);
  }
}
