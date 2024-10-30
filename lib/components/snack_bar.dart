import 'package:flutter/material.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/components/switch_icon.dart';

snackBar(context, {message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          switchIcon(context, message),
          const SizedBox(width: standardSpacing),
          Text(
            message,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      )));
}
