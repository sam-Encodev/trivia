import 'package:flutter/material.dart';

snackBar(context, {message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    message,
    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
  )));
}
