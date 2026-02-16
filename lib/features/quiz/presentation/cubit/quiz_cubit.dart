import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/arguments/quiz_argument.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../data/params/quiz_param.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizRemoteDataSource remoteDataSource;

  QuizCubit(this.remoteDataSource) : super(QuizInitial());

  QuizQuestion? _currentQuestion;
  String? _selectedKey;
  late int _lessonNumber;

  int _questionIndex = 0; // track index
  final int _totalQuestions = 10; // or get from API if available

  bool get isLastQuestion => _questionIndex >= _totalQuestions - 1;

  Future<void> loadQuestion(int lessonNumber) async {
    _lessonNumber = lessonNumber;
    emit(QuizLoading());

    try {
      final question = await remoteDataSource.getQuizQuestion(
        QuizArgument(lessonNumber: lessonNumber),
      );

      _currentQuestion = question;
      _questionIndex = 0; // first question
      _selectedKey = null;

      emit(QuizLoaded(question));
    } catch (e) {
      emit(QuizFailure(errorMessage: e.toString()));
    }
  }

  void answerQuestion(String selectedKey) {
    if (_currentQuestion == null) return;

    _selectedKey = selectedKey;
    final isCorrect = selectedKey == _currentQuestion!.correctAnswer;

    emit(QuizAnswered(
      question: _currentQuestion!,
      isCorrect: isCorrect,
      selectedKey: selectedKey,
    ));
  }

  Future<void> nextQuestion() async {
    if (isLastQuestion) return; // don’t load if last

    emit(QuizLoading());

    try {
      final question = await remoteDataSource.getQuizQuestion(
        QuizArgument(lessonNumber: _lessonNumber),
      );

      _currentQuestion = question;
      _selectedKey = null;
      _questionIndex++;

      emit(QuizLoaded(question));
    } catch (e) {
      emit(QuizFailure(errorMessage: e.toString()));
    }
  }
}

