import 'package:trivia/providers/responder.dart';
import 'package:trivia/models/selected_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResponseState extends Notifier {
  @override
  List<SelectedResponse> build() {
    return [];
  }

  Map<String, int> getScores() {
    var correct =
        state.where((test) => test.correctAnswer == test.selectedOption);

    var incorrect =
        state.where((test) => test.correctAnswer != test.selectedOption);

    var total = correct.toList().length + incorrect.toList().length;

    return {
      "coreect": correct.toList().length,
      "incorrect": incorrect.toList().length,
      "total": total
    };
  }

  void addResponse(SelectedResponse response) {
    ref.read(responserNotifierProvider.notifier).setResponse(true);
    state = [...state, response];
  }

  void removeResponse(SelectedResponse response) {
    ref.read(responserNotifierProvider.notifier).setResponse(false);
    state = state.where((p) => p.id != response.id).toList();
  }

  void editRespose(SelectedResponse response) {
    var oldResponse = state.where((p) => p.id == response.id).toList();

    if (oldResponse.isEmpty) {
      return;
    }

    oldResponse.first.selectedOption = response.selectedOption;
    oldResponse.first.updatedAt = response.updatedAt;
    state = [...state];
  }

  void getRespose(SelectedResponse response) {
    state = state.where((p) => p.id == response.id).toList();
  }
}

final responseNotifierProvider = NotifierProvider(() {
  return ResponseState();
});
