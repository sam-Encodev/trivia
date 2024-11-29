import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:trivia/components/feedback/utils.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({
    super.key,
    required this.onSubmit,
    required this.scrollController,
  });

  final OnSubmit onSubmit;
  final ScrollController? scrollController;

  @override
  State<FeedbackForm> createState() => _FeedbackForm();
}

class _FeedbackForm extends State<FeedbackForm> {
  final FormProps _customFeedback = FormProps();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              if (widget.scrollController != null)
                const FeedbackSheetDragHandle(),
              ListView(
                controller: widget.scrollController,
                // Pad the top by 20 to match the corner radius if drag enabled.
                padding: EdgeInsets.fromLTRB(
                    16, widget.scrollController != null ? 20 : 16, 16, 0),
                children: [
                  const Text('What kind of feedback do you want to give?'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('*'),
                      const SizedBox(
                        width: 8.0,
                      ),
                      DropdownButton<FeedbackType>(
                        value: _customFeedback.feedbackType,
                        items: FeedbackType.values
                            .map(
                              (type) => DropdownMenuItem<FeedbackType>(
                                value: type,
                                child: Text(type
                                    .toString()
                                    .split('.')
                                    .last
                                    .replaceAll('_', ' ')),
                              ),
                            )
                            .toList(),
                        onChanged: (feedbackType) => setState(
                            () => _customFeedback.feedbackType = feedbackType),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('What is your feedback?'),
                  TextField(
                    onChanged: (newFeedback) =>
                        _customFeedback.feedbackText = newFeedback,
                  ),
                ],
              ),
            ],
          ),
        ),
        TextButton(
          // disable this button until the user has specified a feedback type
          onPressed: _customFeedback.feedbackType != null
              ? () => widget.onSubmit(
                    _customFeedback.feedbackText ?? '',
                    extras: _customFeedback.toMap(),
                  )
              : null,
          child: const Text('Submit'),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
