import 'package:trivia/models/question.dart';
import 'package:trivia/providers/questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionsRepository {
  const QuestionsRepository(this.ref);
  final Ref ref;

    List<Question> questions() {
    final questionList = ref.watch(questionNotifierProvider);

    return questionList.toList();
  }

  List<Question> getCategory(value) {
    final category = ref.watch(questionNotifierProvider);
    final results = category.where((test) => test.category == value);

    return results.toList();
  }

  Iterable<Question> getDifficulty(value) {
    final category = ref.watch(questionNotifierProvider);
    final results = category.where((test) => test.difficulty == value);

    return results.toList();
  }
}