import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/screens/questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:trivia/providers/response_provider.dart';

class Review extends ConsumerStatefulWidget {
  const Review({super.key});

  @override
  ConsumerState<Review> createState() => _Review();
}

class _Review extends ConsumerState<Review> {
  @override
  Widget build(BuildContext context) {
    // var getResponse = ref.watch(responseNotifierProvider);
    // var responses = getResponse.toList();

    var showExtra = true;
    var correctAnswer = "Correct";

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        // leadingWidth: 0,
        leading: IconButton(
          icon: const Icon(Icons.home),
          // icon: const Icon(Icons.delete_forever),
          tooltip: 'Home',
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        title: const Text(
          review,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cached),
            // icon: const Icon(Icons.delete_forever),
            tooltip: 'Retake',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const PopScope(canPop: false, child: Questions()),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Total Questions"), Text("Total Questions")],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Correctly Answered"),
                Text("Correctly Answered"),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wrongly Answered"),
                Text("Wrongly Answered"),
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: const Text(
                  "note.title",
                ),
                trailing: showExtra == true
                    ? const Icon(Icons.check_circle_outline_outlined,
                        color: Colors.green)
                    : const Icon(Icons.error_outline_outlined,
                        color: Colors.red),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "hello",
                      style: TextStyle(
                          color: showExtra == true ? Colors.green : Colors.red),
                    ),
                    if (showExtra == false)
                      Text(
                        "correct: $correctAnswer",
                      )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 10.0,
            ),
          ))
        ],
      ),
    );
  }
}
