class QuizArgument {
  final int lessonNumber;
  QuizArgument({required this.lessonNumber});

  Map<String, dynamic> toJson() {
    return {'lesson_number': lessonNumber};
  }
}