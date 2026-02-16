import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/data_source/remote_data_source.dart';
import '../../data/params/quiz_param.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizRemoteDataSource remoteDataSource;

  QuizCubit(this.remoteDataSource) : super(QuizInitial());

  QuizQuestion? _currentQuestion;
  late int _lessonNumber;

  Future<void> loadQuestion(int lessonNumber) async {
    _lessonNumber = lessonNumber;

    emit(QuizLoading());

    try {
      final question =
      await remoteDataSource.getQuizQuestion(_lessonNumber);

      _currentQuestion = question;

      emit(QuizLoaded(question));
    } catch (e) {
      emit(QuizFailure(errorMessage: e.toString()));
    }
  }

  void answerQuestion(String selectedKey) {
    if (_currentQuestion == null) return;

    final isCorrect =
        selectedKey == _currentQuestion!.correctAnswer;

    emit(
      QuizAnswered(
        question: _currentQuestion!,
        isCorrect: isCorrect,
      ),
    );
  }

  Future<void> nextQuestion() async {
    emit(QuizLoading());

    try {
      final question =
      await remoteDataSource.getQuizQuestion(_lessonNumber);

      _currentQuestion = question;

      emit(QuizLoaded(question));
    } catch (e) {
      emit(QuizFailure(errorMessage: e.toString()));
    }
  }
}
