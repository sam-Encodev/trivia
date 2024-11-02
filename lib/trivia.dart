import 'package:flutter/material.dart';
import 'package:trivia/screens/home.dart';
import 'package:trivia/screens/reviews.dart';
import 'package:trivia/screens/questions.dart';

class Trivia extends StatelessWidget {
  const Trivia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Home(),
        '/review': (context) => const Reviews(),
        '/questions': (context) => const Questions(),
      },
    );
  }
}
