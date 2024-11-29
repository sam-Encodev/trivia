import 'dart:io';
import 'dart:typed_data';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trivia/constants/text.dart';

class FormProps {
  FormProps({
    this.feedbackType,
    this.feedbackText,
  });

  FeedbackType? feedbackType;
  String? feedbackText;

  @override
  String toString() {
    return {
      'feedback_type': feedbackType.toString(),
      'feedback_text': feedbackText,
    }.toString();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'feedback_type': feedbackType.toString(),
      'feedback_text': feedbackText,
    };
  }
}

enum FeedbackType {
  bugReport,
  featureRequest,
}

Future<String> writeImageToStorage(Uint8List screenshot) async {
  final Directory output = await getTemporaryDirectory();
  final String screenshotFilePath = '${output.path}/feedback.png';
  final File screenshotFile = File(screenshotFilePath);
  await screenshotFile.writeAsBytes(screenshot);
  return screenshotFilePath;
}

void alertFeedbackFunction(
  BuildContext outerContext,
  UserFeedback feedback,
) {
  var message = feedback.text;
  var type = feedback.extra?.values.first;

  showDialog<void>(
    context: outerContext,
    builder: (context) {
      return AlertDialog(
        title: const Text(report),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Type",
                textAlign: TextAlign.left,
              ),
              Text(type, style: const TextStyle(backgroundColor: Colors.red)),
              if (message.isNotEmpty)
                const SizedBox(
                  height: 16.0,
                ),
              if (message.isNotEmpty)
                const Text(
                  "Message",
                  textAlign: TextAlign.left,
                ),
              Text(message,
                  style: const TextStyle(backgroundColor: Colors.red)),
              Image.memory(
                feedback.screenshot,
                height: 600,
                width: 500,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
