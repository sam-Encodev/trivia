import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTheme extends Notifier {
  @override
  build() {
    return ThemeMode.system;
  }

  void setTheme(value) {
    state = value;
  }
}

final appTheme = NotifierProvider(() {
  return AppTheme();
});
