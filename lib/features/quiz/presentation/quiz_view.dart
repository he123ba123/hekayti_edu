import 'package:flutter/material.dart';
import 'package:hekayti/features/quiz/presentation/widgets/header.dart';
import 'package:hekayti/features/quiz/presentation/widgets/question_card.dart';
import 'package:hekayti/features/quiz/presentation/widgets/quiz_options.dart';
import 'package:hekayti/features/quiz/presentation/widgets/result_card.dart';
import '../data/arguments/quiz_argument.dart';

class QuizView extends StatefulWidget {
  final QuizArgument quizArgument;
  const QuizView({
    super.key,
    required this.quizArgument
  });

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int? selectedOptionId;
  bool showResult = false;

  void selectOption(int optionId) {
    if (showResult) return;

    setState(() {
      selectedOptionId = optionId;
      showResult = true;
    });
  }

  bool get isCorrect =>
      selectedOptionId == widget.quizArgument.question.correctOptionId;

  @override
  Widget build(BuildContext context) {
    final progress =
        (widget.quizArgument.currentIndex + 1) / widget.quizArgument.totalQuestions;

    return Scaffold(
      backgroundColor: const Color(0xffF5F7F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
          
                /// HEADER
                Header(progress: progress),

                const SizedBox(height: 30),
          
                /// QUESTION CARD
                QuestionCard(text:widget.quizArgument.question.question),
                const SizedBox(height: 25),
          
                /// OPTIONS
                ...widget.quizArgument.question.options.map(
                      (option) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: QuizOptionWidget(
                      option: option,
                      isSelected: selectedOptionId == option.id,
                      isCorrect:
                      widget.quizArgument.question.correctOptionId == option.id,
                      showResult: showResult,
                      onTap: () => selectOption(option.id),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
          
                if (showResult)
                  ResultCard(isCorrect: isCorrect),
          
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
