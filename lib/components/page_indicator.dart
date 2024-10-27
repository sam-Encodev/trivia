import 'package:flutter/material.dart';
import 'package:trivia/constants/styles.dart';
import 'package:trivia/constants/spacing.dart';

class PageIndicator extends StatelessWidget {
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
  Widget build(BuildContext context) {
    var length = tabController.length - 1;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (currentPageIndex > 0)
          IconButton(
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            style: maxIconButtonStyle(context),
            icon: const Icon(
              Icons.arrow_left,
              size: maxIcons,
              color: Colors.white,
            ),
          ),
        const SizedBox(width: standardSpacing),
        IconButton(
          onPressed: () {
            if (currentPageIndex == length) {
              return;
            }
            onUpdateCurrentPageIndex(currentPageIndex + 1);
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
