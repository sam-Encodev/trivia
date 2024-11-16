import 'package:trivia/utils/theme_transformer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTheme extends Notifier {
  @override
  build() {
    return themeTransformer();
  }

  void setTheme(value) {
    state = value;
  }
}

final appTheme = NotifierProvider(() {
  return AppTheme();
});
