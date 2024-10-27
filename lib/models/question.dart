class Question {
  Question(
      {required this.id,
      required this.category,
      required this.idcorrectAnswer,
      required this.incorrectAnswers,
      required this.question,
      required this.tags,
      required this.type,
      required this.difficulty,
      required this.regions,
      required this.isNiche,
      required this.options});
  String id;
  String category;
  String idcorrectAnswer;
  List incorrectAnswers;
  String question;
  String? type;
  List? tags;
  String? difficulty;
  List? regions;
  bool? isNiche;
  List? options;
}
