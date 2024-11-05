import 'package:flutter/material.dart';
import 'package:trivia/constants/colors.dart';
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

buttonStyle(context, {size = "medium"}) {
  var type = size == "medium" ? 50.0 : 40.0;
  return ButtonStyle(
    backgroundColor: const WidgetStatePropertyAll(mainBG),
    minimumSize: WidgetStateProperty.all(Size(double.infinity, type)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
    ),
  );
}
