import 'package:flutter/material.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/constants/questions.dart';
import 'package:trivia/components/view_question.dart';
import 'package:trivia/components/page_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Questions extends ConsumerStatefulWidget {
  const Questions({super.key});

  @override
  ConsumerState<Questions> createState() => _Questions();
}

class _Questions extends ConsumerState<Questions>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  int inputs = 4;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: inputs, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  final results = Results().getQuestions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Questions",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              height: boxMaxHeight,
              child: PageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ViewQuestion(data: results[index]);
                },
                itemCount: results.length,
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
              )),
          SizedBox(
            height: boxMinHeight,
            child: PageIndicator(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              // size: inputs
            ),
          ),
        ],
      ),
    );
  }
}
