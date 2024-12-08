import 'package:flutter/material.dart';
import 'package:trivia/components/switch_icon.dart';

class Review extends StatelessWidget {
  final dynamic review;
  const Review({super.key, this.review});

  @override
  Widget build(BuildContext context) {
    final bool validity = review.selectedOption == review.correctAnswer;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      title: Text(
        review.question,
        style: const TextStyle(fontSize: 14.0),
      ),
      trailing: switchIcon(context, validity),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (validity)
            Text(
              review.selectedOption,
              style: TextStyle(color: validity ? Colors.green : Colors.pink),
            ),
          if (!validity)
            RichText(
                text: TextSpan(
              children: [
                const TextSpan(
                    text: "correct: ", style: TextStyle(color: Color(0xFF7C7C7C))),
                TextSpan(
                    text: review.correctAnswer,
                    style: const TextStyle(color: Colors.green))
              ],
            ))
        ],
      ),
    );
  }
}
