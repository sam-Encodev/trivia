import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trivia/providers/questions.dart';

class DailyTriviaQuestions extends Notifier {
  @override
  build() {
    return [].toList();
  }

  void shuffle() {
    final questions = ref.watch(questionNotifierProvider);
    questions.shuffle();

    if (!state.contains(questions.first)) {
      state = [...state, questions.first];
    }
  }
}

final dailyTriviaQuestions = NotifierProvider(() {
  return DailyTriviaQuestions();
});

class DailyTriviaSettings extends Notifier {
  @override
  build() {
    return false;
  }

  void setResponse(value) {
    state = value;
  }
}

final dailyTriviaSettings = NotifierProvider(() {
  return DailyTriviaSettings();
});
