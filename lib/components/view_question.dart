import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/models/selected_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewQuestion extends ConsumerStatefulWidget {
  const ViewQuestion({
    super.key,
    required this.index,
    required this.data,
    required this.length,
    required this.getSelected,
  });

  final int index;
  final dynamic data;
  final int length;
  final void Function(SelectedResponse, bool) getSelected;

  @override
  ConsumerState<ViewQuestion> createState() => _QuestionState();
}

class _QuestionState extends ConsumerState<ViewQuestion> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    var getSelected = widget.getSelected;

    var index = widget.index.toString();
    var totalQuestions = widget.length.toString();
    var correctAnswer = widget.data.correctAnswer;
    var incorrectAnswers = widget.data.incorrectAnswers;

    final List<String> options = [correctAnswer, ...incorrectAnswers];
    // options.shuffle();

    var info = Question(
      id: widget.data.id,
      category: widget.data.category,
      correctAnswer: widget.data.correctAnswer,
      incorrectAnswers: widget.data.incorrectAnswers,
      question: widget.data.question,
      type: widget.data.type,
      tags: widget.data.tags,
      difficulty: widget.data.difficulty,
      regions: widget.data.regions,
      isNiche: widget.data.isNiche,
      options: options,
    );

    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: index,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: slash),
                TextSpan(text: totalQuestions),
              ],
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 30.0,
          ),
          Text(
            info.question.toString(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: double.infinity,
            height: 30.0,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            spacing: standardSpacing,
            children: info.options!.asMap().entries.map((entry) {
              return InputChip(
                label: Container(
                  alignment: Alignment.center,
                  width: 240.0,
                  height: 42.0,
                  child: Text(
                    textAlign: TextAlign.center,
                    entry.value,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: false,
                  ),
                ),
                showCheckmark: false,
                selected: selectedIndex == entry.key,
                onSelected: (bool selected) {
                  setState(() {
                    if (selectedIndex == entry.key) {
                      getSelected(SelectedResponse(), false);
                      selectedIndex = null;
                    } else {
                      selectedIndex = entry.key;
                      var option = SelectedResponse(
                          userID: 1,
                          questionID: info.id,
                          options: info.options,
                          id: int.tryParse(index),
                          question: info.question,
                          selectedOption: entry.value,
                          createdAt: DateTime.timestamp().toString(),
                          updatedAt: DateTime.timestamp().toString(),
                          correctAnswer: info.correctAnswer);
                      getSelected(option, true);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(
            width: double.infinity,
            height: 30.0,
          ),
          const SizedBox(
            width: double.infinity,
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
