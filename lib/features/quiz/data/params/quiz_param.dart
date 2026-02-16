class QuizResponse {
  final List<QuizQuestion> mcqs;

  QuizResponse({required this.mcqs});

  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(
      mcqs: (json['mcqs'] as List)
          .map((e) => QuizQuestion.fromJson(e))
          .toList(),
    );
  }
}

class QuizQuestion {
  final String question;
  final List<QuizOption> options;
  final String correctAnswer;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    final optionsMap = Map<String, dynamic>.from(json['options']);

    return QuizQuestion(
      question: json['question'],
      correctAnswer: json['answer'],
      options: optionsMap.entries
          .map(
            (entry) => QuizOption(
          key: entry.key,
          text: entry.value,
        ),
      )
          .toList(),
    );
  }
}

class QuizOption {
  final String key; // A / B / C / D
  final String text;

  QuizOption({
    required this.key,
    required this.text,
  });
}
