import 'package:flutter/material.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/components/view_question.dart';
import 'package:trivia/components/page_indicator.dart';
import 'package:trivia/constants/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _Questions();
}

class _Questions extends State<Questions> with TickerProviderStateMixin {
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
        children: [
          SizedBox(
              height: boxMaxHeight,
              child: PageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final result = results[index];
                  // print({"result": results});
                  return ViewQuestion(data: result);
                },
                itemCount: inputs,
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
