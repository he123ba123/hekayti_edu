import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hekayti/features/quiz/presentation/widgets/question_card.dart';
import 'package:hekayti/features/quiz/presentation/widgets/quiz_options.dart';
import 'package:hekayti/features/quiz/presentation/widgets/result_card.dart';

import '../cubit/quiz_cubit.dart';
import 'header.dart';

class QuizBody extends StatelessWidget {
  final dynamic question;
  final bool showResult;
  final bool? isCorrect;

  const QuizBody({
    required this.question,
    required this.showResult,
    this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            /// HEADER (You can update progress later)
            const Header(progress: 0.5),

            const SizedBox(height: 30),

            /// QUESTION
            QuestionCard(text: question.question),

            const SizedBox(height: 25),

            /// OPTIONS
            ...question.options.map<Widget>(
                  (option) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: QuizOptionWidget(
                  option: option,
                  showResult: showResult,
                  isSelected: false,
                  isCorrect:
                  option.key == question.correctAnswer,
                  onTap: () {
                    context
                        .read<QuizCubit>()
                        .answerQuestion(option.key);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            if (showResult && isCorrect != null)
              ResultCard(isCorrect: isCorrect!),

            const SizedBox(height: 20),

            if (showResult)
              ElevatedButton(
                onPressed: () {
                  context.read<QuizCubit>().nextQuestion();
                },
                child: const Text("السؤال التالي"),
              ),
          ],
        ),
      ),
    );
  }
}
