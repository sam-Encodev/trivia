import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/providers/app_theme.dart';
import 'package:trivia/utils/theme_transformer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segmented_button_slide/segmented_button_slide.dart';

class SegmentButton extends ConsumerStatefulWidget {
  const SegmentButton({super.key});

  @override
  ConsumerState<SegmentButton> createState() => _SegmentButtonState();
}

class _SegmentButtonState extends ConsumerState<SegmentButton> {
  late ThemeMode themeInfo;

  @override
  Widget build(BuildContext context) {
    var theme = ref.watch(appTheme);

    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.7,
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(33),
      ),
      child: SegmentedButtonSlide(
        selectedTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
        ),
        unselectedTextStyle: const TextStyle(color: Color(0xFF21859E)),
        height: 40,
        colors: SegmentedButtonSlideColors(
            barColor: Colors.transparent,
            backgroundSelectedColor:
                Theme.of(context).colorScheme.tertiaryContainer),
        padding: const EdgeInsets.all(4),
        borderRadius: BorderRadius.circular(30),
        // curve: Curves.easeInQuad,
        selectedEntry: (themeDecoder(theme)),
        onChange: (selected) => {
          themeInfo = themeTransformer(value: selected),
          ref.read(appTheme.notifier).setTheme(themeInfo)
        },
        entries: const [
          SegmentedButtonSlideEntry(
            label: system,
            // icon: Icons.add_to_home_screen
          ),
          SegmentedButtonSlideEntry(
            label: light,
            // icon: Icons.wb_sunny,
          ),
          SegmentedButtonSlideEntry(
            label: dark,
            // icon: Icons.brightness_2,
          ),
        ],
      ),
    );
  }
}
