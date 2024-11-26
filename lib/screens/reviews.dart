import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/constants/styles.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/providers/response.dart';
import 'package:trivia/components/review/radial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/components/review/list_reviews.dart';

class Reviews extends ConsumerStatefulWidget {
  const Reviews({super.key});

  @override
  ConsumerState<Reviews> createState() => _Reviews();
}

class _Reviews extends ConsumerState<Reviews> {
  late bool showList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(minRadius)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          tooltip: home,
          onPressed: () {
            ref.read(responseProvider.notifier).reset();
            context.go('/');
          },
        ),
        actions: [
          IconButton(
            tooltip: "Settings",
            icon: const Icon(Icons.settings_suggest_outlined),
            onPressed: () => {
              setState(() {
                showList = !showList;
              })
            },
          ),
        ],
      ),
      body: PopScope(
          canPop: false,
          child: Container(
              height: MediaQuery.of(context).size.height / 1.4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(minRadius),
                  topRight: Radius.circular(minRadius),
                  bottomLeft: Radius.circular(minRadius),
                  bottomRight: Radius.circular(minRadius),
                ),
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
              ),
              child: showList ? const ListReviews() : const Radial())),
      bottomNavigationBar: BottomAppBar(
        height: 85,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            FilledButton(
                style: buttonStyle(context),
                onPressed: () {
                  context.go('/');
                },
                child: const Text(
                  "Home",
                  style: TextStyle(fontSize: standardFont),
                )),
          ],
        ),
      ),
    );
  }
}

      // Radial(),