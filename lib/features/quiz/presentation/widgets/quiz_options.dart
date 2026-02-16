import 'package:flutter/material.dart';

import '../../data/params/quiz_param.dart';


class QuizOptionWidget extends StatelessWidget {
  final QuizOption option;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;
  final VoidCallback? onTap; // nullable

  const QuizOptionWidget({
    super.key,
    required this.option,
    required this.isSelected,
    required this.isCorrect,
    required this.showResult,
    this.onTap, // optional
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.grey.shade300;
    Color backgroundColor = Colors.white;

    if (showResult) {
      if (isCorrect) {
        borderColor = Colors.green;
        backgroundColor = Colors.green.withOpacity(.1);
      } else if (isSelected) {
        borderColor = Colors.red;
        backgroundColor = Colors.red.withOpacity(.1);
      }
    }

    return GestureDetector(
      onTap: onTap, // just nullable, no !
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                option.text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            if (showResult && isCorrect)
              const Icon(Icons.check_circle, color: Colors.green),
            if (showResult && isSelected && !isCorrect)
              const Icon(Icons.close, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
