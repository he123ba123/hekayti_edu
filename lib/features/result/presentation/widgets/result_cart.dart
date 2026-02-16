import 'package:flutter/material.dart';

import 'circle_progress.dart';
import 'label_row.dart';

class ResultCart extends StatelessWidget {
  const ResultCart({super.key, required this.score});
final double score;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        children: [
          /// CIRCLE PROGRESS
          CircleProgress(score: score,),
          const SizedBox(height: 20),
          /// LABEL ROW
          LabelRow(),
          const SizedBox(height: 10),
          /// LINE PROGRESS
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: score,
              minHeight: 10,
              backgroundColor: Colors.grey.shade200,
              color: const Color(0xff7CC0DA),
            ),
          ),
        ],
      ),
    );
  }
}
