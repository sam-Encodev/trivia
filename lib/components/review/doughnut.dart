import 'package:flutter/material.dart';
import 'package:trivia/models/chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/providers/response_provider.dart';

class Doughnut extends ConsumerWidget {
  const Doughnut({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var responder = ref.watch(responseNotifierProvider.notifier).getScores();

    final int accurate = responder['accurate'] ?? 0;
    final int inaccurate = responder['inaccurate'] ?? 0;

    final chartData = [
      ChartData('Accurate', accurate, Colors.greenAccent),
      ChartData('Inaccurate', inaccurate, Colors.pink),
    ];

    return Scaffold(
        body: Center(
            child: SfCircularChart(
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CircularSeries<ChartData, dynamic>>[
          DoughnutSeries<ChartData, dynamic>(
              dataSource: chartData,
              cornerStyle: CornerStyle.bothCurve,
              xValueMapper: (ChartData data, _) => data.info,
              yValueMapper: (ChartData data, _) => data.value,
              pointColorMapper: (ChartData data, _) => data.color)
        ])));
  }
}
