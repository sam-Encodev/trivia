import 'package:trivia/models/selected_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Response extends Notifier {
  @override
  List build() {
    return [].toList();
  }

  Map<String, int> getScores() {
    var correct =
        state.where((test) => test.correctAnswer == test.selectedOption);

    var incorrect =
        state.where((test) => test.correctAnswer != test.selectedOption);

    var total = correct.toList().length + incorrect.toList().length;

    return {
      "accurate": correct.toList().length,
      "inaccurate": incorrect.toList().length,
      "total": total
    };
  }

  void reset() {
    state = [];
  }

  void addResponse(SelectedResponse response) {
    state = [...state, response];
  }

  void removeResponse(SelectedResponse response) {
    state = state.where((p) => p.id != response.id).toList();
  }

  void editResponse(SelectedResponse response) {
    var oldResponse = state.where((p) => p.id == response.id).toList();

    if (oldResponse.isEmpty) {
      return;
    }

    oldResponse.first.selectedOption = response.selectedOption;
    oldResponse.first.updatedAt = response.updatedAt;
    state = [...state];
  }

  void getResponse(SelectedResponse response) {
    state = state.where((p) => p.id == response.id).toList();
  }
}

final responseProvider = NotifierProvider(() {
  return Response();
});

class ResponseState extends Notifier {
  @override
  build() {
    return false;
  }

  void setResponse(value) {
    state = value;
  }
}

final responseStateProvider = NotifierProvider(() {
  return ResponseState();
});
