import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/screens/questions.dart';
import 'package:trivia/components/review/radial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/providers/response_provider.dart';
import 'package:trivia/components/review/list_reviews.dart';

class Reviews extends ConsumerWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        // leadingWidth: 0,
        leading: IconButton(
          icon: const Icon(Icons.home),
          // icon: const Icon(Icons.delete_forever),
          tooltip: home,
          onPressed: () {
            ref.read(responseNotifierProvider.notifier).reset();
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        title: const Text(
          review,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cached),
            // icon: const Icon(Icons.delete_forever),
            tooltip: retake,
            onPressed: () {
              ref.read(responseNotifierProvider.notifier).reset();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const PopScope(canPop: false, child: Questions()),
                ),
              );
            },
          ),
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: Radial()), Expanded(child: ListReviews())],
      ),
    );
  }
}
