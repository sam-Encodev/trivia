class Question {
  final String? id;
  final String? category;
  final String? correctAnswer;
  final List? incorrectAnswers;
  final String? question;
  final String? type;
  final List? tags;
  final String? difficulty;
  final List? regions;
  final bool? isNiche;
  final List? options;

  Question(
      {required this.id,
      required this.category,
      required this.correctAnswer,
      required this.incorrectAnswers,
      required this.question,
      required this.tags,
      required this.type,
      required this.difficulty,
      required this.regions,
      required this.isNiche,
      required this.options});

  factory Question.fromJson(json) {
    final id = json['id'];
    final category = json['category'];
    final correctAnswer = json['correctAnswer'];
    final incorrectAnswers = json['incorrectAnswers'];
    final question = json['question'];
    final tags = json['tags'];
    final type = json['type'];
    final difficulty = json['difficulty'];
    final regions = json['regions'];
    final isNiche = json['isNiche'];
    final options = [json['correctAnswer'], ...incorrectAnswers];
    options.shuffle();

    return Question(
      id: id,
      category: category,
      correctAnswer: correctAnswer,
      incorrectAnswers: incorrectAnswers,
      question: question,
      type: type,
      tags: tags,
      difficulty: difficulty,
      regions: regions,
      isNiche: isNiche,
      options: options,
    );
  }
}


//   Question(
//   id: json['id'] as String,
//   category: json['catergory'],
//   correctAnswer: json['correctAnswer'] as String,
//   incorrectAnswers: json['incorrectAnswers'],
//   question: json['question'] as String,
//   type: json['type'] as String,
//   tags: json['tags'],
//   difficulty: json['difficulty'] as String,
//   regions: json['regions'],
//   isNiche: json['isNiche'] as bool,
//   options: json['options'],
// );