import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/components/category_list.dart';
import 'package:trivia/constants/questions.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/constants/styles.dart';
import 'package:trivia/providers/daily_trivia.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    // timeDilation = 3.5; // 1.0 m
    timeDilation = 2.0;
    var settings = ref.watch(dailyTriviaSettings);
    var questions = ref.watch(dailyTriviaQuestions);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: const Text("Trivia"),
        actions: [
          IconButton(
            tooltip: "Daily Trivia",
            icon: const Icon(Icons.wifi_protected_setup_outlined),
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (context) => SizedBox(
                      height: 150,
                      child: Center(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: 10,
                          children: questionQty.asMap().entries.map((entry) {
                            return InputChip(
                              label: SizedBox(
                                width: 80.0,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  entry.value.number.toString(),
                                  maxLines: 3,
                                  overflow: TextOverflow.clip,
                                  softWrap: false,
                                ),
                              ),
                              showCheckmark: true,
                              onSelected: (bool selected) {
                                setState(() {});
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
                style: headerButtonStyle(context),
                child: const Text("# Questions"),
              ),
              FilledButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (context) => const SizedBox(
                      height: 240,
                      child: Center(
                        child: CategoryList(),
                      ),
                    ),
                  );
                },
                style: headerButtonStyle(context),
                child: const Text("Categories"),
              ),
              FilledButton(
                onPressed: () {},
                style: headerButtonStyle(context),
                child: const Text("Streak"),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
              height: MediaQuery.of(context).size.height / 1.50,
              padding: const EdgeInsets.symmetric(vertical: standardSpacing),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(minRadius),
                  topRight: Radius.circular(minRadius),
                  bottomLeft: Radius.circular(minRadius),
                  bottomRight: Radius.circular(minRadius),
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
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        height: 10.0,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    )
                  : const Center(child: Text("Hello")))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 75,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
                style: buttonStyle(context),
                onPressed: () {
                  context.push("/questions");
                },
                child: const Text(
                  "Play",
                  style: TextStyle(fontSize: standardFont),
                )),
          ],
        ),
      ),
    );
  }
}
