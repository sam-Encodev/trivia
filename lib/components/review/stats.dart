import 'package:flutter/material.dart';
// import 'package:trivia/providers/response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Stats extends ConsumerWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var scores = ref.watch(responseProvider.notifier).getScores();

    // final double total = scores['total']!.toDouble();
    // final int accurate = scores['accurate']!;
    // final int inaccrurate = scores['inaccurate']!;

    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Total Questions"), Text("Total Questions")],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Correctly Answered"),
              Text("Correctly Answered"),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Wrongly Answered"),
              Text("Wrongly Answered"),
            ],
          ),
        ),
      ],
    );
  }
}
