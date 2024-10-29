import 'package:flutter/material.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/models/question.dart';

class ViewQuestion extends StatefulWidget {
  const ViewQuestion({super.key, required this.data});

  final Map data;

  @override
  State<ViewQuestion> createState() => _QuestionState();
}

class _QuestionState extends State<ViewQuestion> {
  int inputs = 4;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    var correctAnswer = widget.data["correctAnswer"];
    var incorrectAnswers = widget.data["incorrectAnswers"];

    final List<String> options = [correctAnswer, ...incorrectAnswers];
    options.shuffle();

    var info = Question(
      id: widget.data["id"],
      category: widget.data["category"],
      correctAnswer: widget.data["correctAnswer"],
      incorrectAnswers: widget.data["incorrectAnswers"],
      question: widget.data["question"],
      type: widget.data["type"],
      tags: widget.data["tags"],
      difficulty: widget.data["difficulty"],
      regions: widget.data["regions"],
      isNiche: widget.data["isNiche"],
      options: options,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          info.question.toString(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: standardSpacing),
        Wrap(
          direction: Axis.vertical,
          spacing: standardSpacing,
          children: info.options!.asMap().entries.map((entry) {
            return SizedBox(
              width: 400.0,
              child: InputChip(
                label: Text(
                  entry.value,
                ),
                showCheckmark: false,
                selected: selectedIndex == entry.key,
                onSelected: (bool selected) {
                  setState(() {
                    if (selectedIndex == entry.key) {
                      selectedIndex = null;
                    } else {
                      selectedIndex = entry.key;
                    }
                  });
                },
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: standardSpacing),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedIndex = null;
            });
          },
          child: const Text('Reset'),
        )
      ],
    );
  }
}
