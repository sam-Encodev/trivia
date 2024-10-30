class SelectedResponse {
  int? id;
  int? userID;
  List? options;
  String? question;
  String? createdAt;
  String? updatedAt;
  String? questionID;
  String? correctAnswer;
  String? selectedOption;

  SelectedResponse({
    this.id,
    this.userID,
    this.options,
    this.question,
    this.questionID,
    this.createdAt,
    this.updatedAt,
    this.correctAnswer,
    this.selectedOption,
  });
}
