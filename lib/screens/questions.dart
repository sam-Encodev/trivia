import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/constants/colors.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/components/view_question.dart';
import 'package:trivia/models/selected_response.dart';
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
    ref.read(responseNotifierProvider.notifier).addResponse(options);

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

  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Nevermind'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Leave'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final getQuestions = ref.watch(questionNotifierProvider);
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainBG,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(minRadius)),
          ),
          leadingWidth: 0,
          leading: Container(),
          title: const Text(
            questions,
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.dangerous_rounded),
              tooltip: quit,
              onPressed: () {
                ref.read(responseNotifierProvider.notifier).reset();
                context.go('/');
              },
            ),
            PopScope<Object?>(
              canPop: false,
              onPopInvokedWithResult: (bool didPop, Object? result) async {
                if (didPop) {
                  return;
                }
                final bool shouldPop = await _showBackDialog() ?? false;
                if (context.mounted && shouldPop) {
                  Navigator.pop(context);
                }
              },
              child: IconButton(
                icon: const Icon(Icons.dangerous_rounded),
                tooltip: quit,
                onPressed: () async {
                  final bool shouldPop = await _showBackDialog() ?? false;
                  if (context.mounted && shouldPop) {
                    Navigator.pop(context);
                  }
                },
              ),
            )
          ],
        ),
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: subBG,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PageIndicator(
                      tabController: _tabController,
                      currentPageIndex: _currentPageIndex,
                      onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                      onSubmit: _submitSelected,
                      submitReady: submitReady),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(minRadius),
                    bottomRight: Radius.circular(minRadius),
                  ),
                  color: mainBG,
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
          ],
        ),
      ),
    );
  }
}
