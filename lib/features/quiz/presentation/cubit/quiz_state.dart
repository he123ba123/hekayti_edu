part of 'quiz_cubit.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}
class QuizLoaded extends QuizState {
  final QuizQuestion question;

  QuizLoaded(this.question);
}
final class QuizFailure extends QuizState {
  final String errorMessage;

  QuizFailure({required this.errorMessage});

}
class QuizAnswered extends QuizState {
  final QuizQuestion question;
  final bool isCorrect;
  final String selectedKey;

  QuizAnswered({
    required this.question,
    required this.isCorrect,
    required this.selectedKey,
  });
}
