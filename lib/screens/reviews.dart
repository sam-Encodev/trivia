import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/constants/colors.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/providers/response.dart';
import 'package:trivia/components/review/radial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/components/review/list_reviews.dart';

class Reviews extends ConsumerWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBG,
        shape:  const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(minRadius)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          tooltip: home,
          onPressed: () {
            ref.read(responseProvider.notifier).reset();
            context.go('/');
          },
        ),
      ),
      body: PopScope(
        canPop: false,
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(minRadius),
                bottomRight: Radius.circular(minRadius),
              ),
              color: mainBG,
            ),
            child: const Column(
              children: [
                Expanded(child: Radial()),
                Expanded(child: ListReviews()),
              ],
            )),
      ),
    );
  }
}
