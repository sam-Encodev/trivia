import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/constants/questions.dart';
import 'package:trivia/components/view_question.dart';
import 'package:trivia/components/page_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/providers/response_provider.dart';
import 'package:trivia/providers/questions_provider.dart';

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
  int? selectedIndex;
  final results = Results().getQuestions();

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: results.length.toInt(), vsync: this);
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

  @override
  Widget build(BuildContext context) {
    final getQuestions = ref.watch(questionNotifierProvider);

    var responder = ref.watch(responseNotifierProvider.notifier).getScores();
    print({"responder": responder});

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   // icon: const Icon(Icons.delete_forever),
        //   tooltip: 'Home',
        //   onPressed: () {
        //     Navigator.popUntil(context, ModalRoute.withName('/'));
        //   },
        // ),
        leadingWidth: 0,
        leading: Container(),
        title: const Text(
          questions,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.dangerous_rounded),
            // icon: const Icon(Icons.delete_forever),
            tooltip: 'Quit',
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox.expand(
              child: PageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ViewQuestion(
                      index: index + 1,
                      data: getQuestions[index],
                      length: getQuestions.length.toInt());
                },
                physics: const NeverScrollableScrollPhysics(),
                itemCount: getQuestions.length.toInt(),
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
              ),
            ),
          ),
          PageIndicator(
            tabController: _tabController,
            currentPageIndex: _currentPageIndex,
            onUpdateCurrentPageIndex: _updateCurrentPageIndex,
          ),
          const SizedBox(
            height: 150.0,
          ),
        ],
      ),
    );
  }
}
