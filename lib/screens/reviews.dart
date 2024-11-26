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
        title: const Text("Review"),
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
            tooltip: "Chart",
            icon: Icon(
                showList ? Icons.switch_access_shortcut_outlined : Icons.list),
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
              padding: const EdgeInsets.symmetric(vertical: standardSpacing),
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
              onPressed: () => {
                setState(() {
                  showList = !showList;
                })
              },
              child: Icon(showList
                  ? Icons.switch_access_shortcut_outlined
                  : Icons.list),
            ),
          ],
        ),
      ),
    );
  }
}

      // Radial(),