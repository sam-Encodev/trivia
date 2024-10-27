

import 'package:flutter/material.dart';
import 'package:trivia/constants/spacing.dart';

maxIconButtonStyle(context) {
  return ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(maxButtonRadius),
        ),
      ));
}