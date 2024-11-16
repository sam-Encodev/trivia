import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/providers/daily_trivia.dart';
import 'package:trivia/components/segment_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
    var switchState = ref.watch(dailyTriviaSettings);

    return Scaffold(
      appBar: AppBar(
        title: Text(settings,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(minRadius)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(standardSpacing),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(minRadius),
            topRight: Radius.circular(minRadius),
          ),
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              themeManager,
              textAlign: TextAlign.left,
            ),
            const SegmentButton(),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  dailyTrivia,
                  textAlign: TextAlign.left,
                ),
                Switch(
                    value: switchState,
                    onChanged: (bool value) {
                      setState(() {
                        ref
                            .read(dailyTriviaSettings.notifier)
                            .setResponse(value);
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
