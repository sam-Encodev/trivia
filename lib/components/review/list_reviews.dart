import 'package:flutter/material.dart';
import 'package:trivia/components/empty_state.dart';
import 'package:trivia/components/review/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/providers/response_provider.dart';

class ListReviews extends ConsumerWidget {
  const ListReviews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var getResponse = ref.watch(responseNotifierProvider);
    var responses = getResponse.toList();

    return getResponse.isEmpty
        ? const EmptyState()
        : ListView.separated(
            itemCount: getResponse.length.toInt(),
            itemBuilder: (BuildContext context, int index) {
              return Review(review: responses[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 10.0,
            ),
          );
  }
}