import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hekayti/features/quiz/presentation/widgets/question_card.dart';
import 'package:hekayti/features/quiz/presentation/widgets/quiz_options.dart';
import 'package:hekayti/features/quiz/presentation/widgets/result_card.dart';

import '../../../../core/extentions/navigation.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/quiz_cubit.dart';
import 'header.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is QuizLoaded || state is QuizAnswered) {
          final question = state is QuizLoaded
              ? state.question
              : (state as QuizAnswered).question;

          final selectedKey = state is QuizAnswered ? state.selectedKey : null;
          final showResult = state is QuizAnswered;
          final isCorrect = state is QuizAnswered ? state.isCorrect : null;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Header(progress: 0.5),
                  const SizedBox(height: 30),
                  QuestionCard(text: question.question),
                  const SizedBox(height: 25),

                  // OPTIONS
                  ...question.options.map<Widget>(
                        (option) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: QuizOptionWidget(
                        option: option,
                        showResult: showResult,
                        isSelected: selectedKey != null && option.key != null && selectedKey == option.key,
                        isCorrect: option.key != null && option.key == question.correctAnswer,
                        onTap: (option.key != null && !showResult)
                            ? () {
                          context.read<QuizCubit>().answerQuestion(option.key!); // safe here because we checked != null
                        }
                        : null,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // RESULT CARD
                  if (showResult && isCorrect != null)
                    ResultCard(
                      isCorrect: isCorrect,
                      onNext: () {
                        final cubit = context.read<QuizCubit>();
                        if (cubit.isLastQuestion) {
                          context.pushWithNamed(Routes.resultView);
                        } else {
                          cubit.nextQuestion();
                        }
                      },
                    ),
                ],
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
