import '../params/quiz_param.dart';

class QuizArgument {
 final QuizQuestion question;
  final int currentIndex;
  final int totalQuestions;

  QuizArgument({required this.question, required this.currentIndex, required this.totalQuestions});

}