import 'package:flutter/material.dart';
import 'package:trivia/screens/questions.dart';

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
          child: Column(
        children: [
          const Text("Home"),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Questions()),
              );
            },
            child: const Text("Route to Questions"),
          )
        ],
      )),
    );
  }
}
