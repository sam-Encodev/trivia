import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/screens/reviews.dart';
import 'package:trivia/constants/styles.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/providers/responder.dart';
import 'package:trivia/components/snack_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndicator extends ConsumerWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var length = tabController.length.toInt() - 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {
            var responder = ref.read(responserNotifierProvider);
            var getState = ref.read(responserNotifierProvider);

            if (currentPageIndex == length && getState == true) {
              ref.read(responserNotifierProvider.notifier).setResponse(false);

              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog.adaptive(
                    // title: const Text('AlertDialog Title'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(congratsMessage)
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      Center(
                        child: TextButton(
                          child: const Text(result),
                          onPressed: () {
                            Navigator.pop(context);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PopScope(
                                      canPop: false, child: Reviews())),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
              return;
            }

            if (responder == false) {
              snackBar(context, message: errorEntry);
              return;
            }

            onUpdateCurrentPageIndex(currentPageIndex + 1);
            ref.read(responserNotifierProvider.notifier).setResponse(false);
          },
          style: maxIconButtonStyle(context),
          icon: Icon(
            Icons.arrow_right,
            size: maxIcons,
            color: Theme.of(context).colorScheme.primaryFixed,
          ),
        ),
      ],
    );
  }
}
