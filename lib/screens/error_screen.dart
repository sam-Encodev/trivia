import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/constants/styles.dart';
import 'package:trivia/constants/colors.dart';
import 'package:trivia/constants/spacing.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBG,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(minRadius)),
        ),
        leadingWidth: 0,
        leading: Container(),
      ),
      body: Container(
        padding: const EdgeInsets.all(standardSpacing),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: mainBG,
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
