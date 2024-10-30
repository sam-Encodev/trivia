import 'package:flutter_riverpod/flutter_riverpod.dart';

class Responser extends Notifier {
  @override
  build() {
    return false;
  }

  void setResponse(value) {
    state = value;
  }
}

final responserNotifierProvider = NotifierProvider(() {
  return Responser();
});
