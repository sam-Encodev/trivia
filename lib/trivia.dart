import 'package:flutter/material.dart';
import 'package:trivia/routes/router.dart';
import 'package:trivia/providers/app_theme.dart';
import 'package:trivia/constants/color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Trivia extends ConsumerWidget {
  const Trivia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appTheme);

    return MaterialApp.router(
      title: 'Trivia',
      themeMode: theme,
      theme: Themer.light,
      routerConfig: router,
      darkTheme: Themer.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}