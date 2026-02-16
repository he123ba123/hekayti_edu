import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hekayti/features/quiz/presentation/widgets/quiz_body.dart';

import 'cubit/quiz_cubit.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F9),
      body: SafeArea(
        child: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is QuizFailure) {
              return Center(child: Text(state.errorMessage));
            }
            if (state is QuizLoaded) {
              final question = state.question;
              return QuizBody(
                question: question,
                showResult: false,
              );
            }
            if (state is QuizAnswered) {
              final question = state.question;

              return QuizBody(
                question: question,
                showResult: true,
                isCorrect: state.isCorrect,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
