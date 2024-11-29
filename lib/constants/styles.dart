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

buttonStyle(context, {size = "medium"}) {
  var type = size == "medium" ? 50.0 : 40.0;
  return ButtonStyle(
    backgroundColor:
        WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
    minimumSize: WidgetStateProperty.all(Size(double.infinity, type)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
    ),
  );
}

headerButtonStyle(context) {
  return ButtonStyle(
    backgroundColor:
        WidgetStatePropertyAll(Theme.of(context).colorScheme.outline),
    minimumSize: WidgetStateProperty.all(const Size(110, 40)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
    ),
  );
}
