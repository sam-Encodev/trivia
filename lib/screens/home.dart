import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leadingWidth: 0,
        leading: Container(),
        title: null,
      ),
      body: Center(
          child: TextButton(
        onPressed: () {
          context.push("/questions");
        },
        child: const Text("Play Trivia"),
      )),
    );
  }
}
