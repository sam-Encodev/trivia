import 'package:trivia/trivia.dart';
import 'package:flutter/material.dart';
import 'package:feedback/feedback.dart';
import 'package:trivia/components/feedback/form.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBack();
}

class _FeedBack extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      feedbackBuilder: (context, onSubmit, scrollController) => FeedbackForm(
        onSubmit: onSubmit,
        scrollController: scrollController,
      ),
      theme: FeedbackThemeData(
        background: Colors.grey,
        feedbackSheetColor: Colors.grey[50]!,
        drawColors: [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
        ],
      ),
      darkTheme: FeedbackThemeData.dark(),
      localizationsDelegates: [
        GlobalFeedbackLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeOverride: const Locale('en'),
      mode: FeedbackMode.draw,
      pixelRatio: 1,
      child: const Trivia(),
    );
  }
}
