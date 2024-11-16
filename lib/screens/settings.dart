import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/providers/app_theme.dart';
import 'package:trivia/providers/daily_trivia.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  late var theme = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    var theme = ref.watch(appTheme);
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
          color: Theme.of(context).colorScheme.primaryFixed,
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
            SegmentedButton(
                segments: const [
                  ButtonSegment(
                      value: ThemeMode.system,
                      label: Text(system),
                      icon: Icon(Icons.add_to_home_screen)),
                  ButtonSegment(
                      value: ThemeMode.light,
                      label: Text(light),
                      icon: Icon(Icons.wb_sunny)),
                  ButtonSegment(
                      value: ThemeMode.dark,
                      label: Text(dark),
                      icon: Icon(Icons.brightness_2))
                ],
                selected: {
                  theme
                },
                onSelectionChanged: (newSelection) {
                  ref.read(appTheme.notifier).setTheme(newSelection.first);
                }),
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
