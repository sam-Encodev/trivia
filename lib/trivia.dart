import 'package:flutter/material.dart';
import 'package:trivia/screens/questions.dart';

class Trivia extends StatelessWidget {
  const Trivia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trivia',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Questions());
  }
}
