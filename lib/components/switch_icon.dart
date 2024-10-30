import 'package:flutter/material.dart';
import 'package:trivia/constants/text.dart';
import 'package:trivia/constants/spacing.dart';

switchIcon(context, message) {
  switch (message) {
    case completionEntry:
      return const Icon(Icons.check_circle_outline_outlined,
          size: standardIcon, color: Colors.green);

    case errorEntry:
      return Icon(Icons.error_outline_outlined,
          size: standardIcon, color: Theme.of(context).colorScheme.error);
  }
}
