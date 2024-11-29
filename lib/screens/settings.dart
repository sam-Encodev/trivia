import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:trivia/components/feedback/utils.dart';
import 'package:trivia/components/snack_bar.dart';
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
  bool isHTML = true;

  @override
  Widget build(BuildContext context) {
    var switchState = ref.watch(dailyTriviaSettings);

    Future<void> sendEmail(feedback, String imagePath) async {
      var message = feedback.text;
      var type = feedback.extra?.values.first;

      final Email email = Email(
          body: message,
          subject: "App Review: $type",
          recipients: ["info@info.com"],
          attachmentPaths: [imagePath],
          isHTML: isHTML);

      String platformResponse;

      try {
        await FlutterEmailSender.send(email);
        platformResponse = 'success';
      } catch (error) {
        platformResponse = error.toString();
      }

      if (!mounted) return;

      snackBar(context, message: platformResponse);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(settings),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(minRadius)),
        ),
        actions: [
          IconButton(
            tooltip: "Settings",
            icon: const Icon(Icons.info_outline),
            onPressed: () => {
              showDialog<dynamic>(
                context: context,
                builder: (_) {
                  return const AlertDialog(
                    title: Text("Share Feedback"),
                    content: MarkdownBody(data: markdownData),
                  );
                },
              )
            },
          ),
        ],
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  feedback,
                  textAlign: TextAlign.left,
                ),
                IconButton(
                  tooltip: "Email",
                  icon: const Icon(Icons.mail_outline),
                  onPressed: () => {
                    BetterFeedback.of(context).show(
                      (feedback) async {
                        var screenshotFilePath =
                            await writeImageToStorage(feedback.screenshot);
                        sendEmail(feedback, screenshotFilePath);
                        alertFeedbackFunction(
                          // ignore: use_build_context_synchronously
                          context,
                          feedback,
                        );
                      },
                    )
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
