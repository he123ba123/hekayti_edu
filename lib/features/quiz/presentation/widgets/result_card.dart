import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hekayti/core/extentions/navigation.dart';

import '../../../../core/routing/routes.dart';
import '../cubit/quiz_cubit.dart';

class ResultCard extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onNext;

  const ResultCard({super.key, required this.isCorrect, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: isCorrect
            ? Colors.green.withOpacity(.1)
            : Colors.red.withOpacity(.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            isCorrect ? "أحسنت! إجابة رائعة" : "إجابة غير صحيحة",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isCorrect ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff7BB4CC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.arrow_back, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  "السؤال التالي",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

