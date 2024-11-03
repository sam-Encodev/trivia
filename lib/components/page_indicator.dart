import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/screens/reviews.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {
            if (currentPageIndex == length && submitReady == true) {
              onSubmit();

              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog.adaptive(
                    // title: const Text('AlertDialog Title'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[Text(congratsMessage)],
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

            if (submitReady == false) {
              snackBar(context, message: errorEntry);
              return;
            }

            onUpdateCurrentPageIndex(currentPageIndex + 1);
            onSubmit();
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
