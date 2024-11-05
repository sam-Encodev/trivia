import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/constants/styles.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(standardSpacing),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: standardSpacing),
              FilledButton(
                  onPressed: () => context.go("/"),
                  style: buttonStyle(context),
                  child: const Text("Go Home",
                      style: TextStyle(fontSize: standardFont))),
            ],
          ),
        ),
      ),
    );
  }
}
