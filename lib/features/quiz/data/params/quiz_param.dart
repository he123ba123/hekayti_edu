class QuizQuestion {
  final int id;
  final String question;
  final List<QuizOption> options;
  final int correctOptionId;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionId,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'],
      question: json['question'],
      correctOptionId: json['correct_option_id'],
      options: (json['options'] as List)
          .map((e) => QuizOption.fromJson(e))
          .toList(),
    );
  }
}
class QuestionModel {
  final String id;
  final String title;
  final List<AnswerModel> answers;
  final String correctAnswerId;

  QuestionModel({
    required this.id,
    required this.title,
    required this.answers,
    required this.correctAnswerId,
  });
}
class QuizOption {
  final int id;
  final String text;

  QuizOption({
    required this.id,
    required this.text,
  });

  factory QuizOption.fromJson(Map<String, dynamic> json) {
    return QuizOption(
      id: json['id'],
      text: json['text'],
    );
  }
}
class AnswerModel {
  final String id;
  final String text;

  AnswerModel({
    required this.id,
    required this.text,
  });
}
