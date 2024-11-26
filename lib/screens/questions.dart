import 'package:flutter/material.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/providers/response.dart';
import 'package:trivia/providers/questions.dart';
import 'package:trivia/components/view_question.dart';
import 'package:trivia/models/selected_response.dart';
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
  late bool submitReady = false;
  late SelectedResponse options;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(
        length: ref.read(questionNotifierProvider).length.toInt(), vsync: this);
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

  void _submitSelected() {
    ref.read(responseProvider.notifier).addResponse(options);

    setState(() {
      submitReady = false;
    });
  }

  void _getSelected(SelectedResponse option, bool state) {
    if (state) {
      setState(() {
        submitReady = state;
        options = option;
      });

      return;
    }

    setState(() {
      submitReady = state;
      options = SelectedResponse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final getQuestions = ref.watch(questionNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(minRadius)),
        ),
        // leadingWidth: 0,
        // leading: Container(),
        // title: const Text(
        //   questions,
        //   textAlign: TextAlign.center,
        // ),
      ),
      body: Container(
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
          child: Column(
            children: [
              Expanded(
                child: SizedBox.expand(
                  child: PageView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ViewQuestion(
                        index: index + 1,
                        data: getQuestions[index],
                        length: getQuestions.length.toInt(),
                        getSelected: _getSelected,
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: getQuestions.length.toInt(),
                    controller: _pageViewController,
                    onPageChanged: _handlePageViewChanged,
                  ),
                ),
              ),
            ],
          )),
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
            PageIndicator(
                tabController: _tabController,
                currentPageIndex: _currentPageIndex,
                onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                onSubmit: _submitSelected,
                submitReady: submitReady),
          ],
        ),
      ),
    );
  }
}
