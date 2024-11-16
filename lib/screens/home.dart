import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/providers/daily_trivia.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    var settings = ref.watch(dailyTriviaSettings);
    var questions = ref.watch(dailyTriviaQuestions);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leadingWidth: 0,
        leading: Container(),
        title: const Text("Hollow"),
        actions: [
          IconButton(
            tooltip: "Daily Trivia",
            icon: const Icon(Icons.wifi_protected_setup_sharp),
            onPressed: () =>
                {ref.read(dailyTriviaQuestions.notifier).shuffle()},
          ),
          IconButton(
            tooltip: "Settings",
            icon: const Icon(Icons.settings_suggest_outlined),
            onPressed: () => context.push("/settings"),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(standardSpacing),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(minRadius),
              topRight: Radius.circular(minRadius),
            ),
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
          ),
          child: settings
              ? ListView.separated(
                  itemCount: questions.length.toInt(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        questions[index].question,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                )
              : const Center(child: Text("Hello"))),
    );
  }
}