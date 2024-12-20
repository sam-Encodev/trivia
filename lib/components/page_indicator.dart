import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/constants/styles.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/components/snack_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndicator extends ConsumerWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.onSubmit,
    required this.submitReady,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final void Function() onSubmit;
  final bool submitReady;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var length = tabController.length.toInt() - 1;
    return FilledButton(
        style: buttonStyle(context),
        onPressed: () {
          // print({"pagelength": length});
          // print({"currentPageIndex": currentPageIndex});
          // print({"submitReady": submitReady});

          if (currentPageIndex == length && submitReady == true) {
            onSubmit();

            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog.adaptive(
                  content: const Text(congratsMessage),
                  actions: [
                    TextButton(
                      child: const Text(result),
                      onPressed: () {
                        context.push("/reviews");
                      },
                    )
                  ],
                );
              },
            );
            return;
          }

          if (submitReady == false) {
            snackBar(context, message: errorEntry);
            return;
          }

          onUpdateCurrentPageIndex(currentPageIndex + 1);
          onSubmit();
        },
        child: const Text("Next", style: TextStyle(fontSize: standardFont)));
  }
}
