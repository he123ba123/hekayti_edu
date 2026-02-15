import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleProgress extends StatelessWidget {
  const CircleProgress({super.key, required this.score});
final double score;
  @override
  Widget build(BuildContext context) {
    return  CircularPercentIndicator(
      radius: 90,
      lineWidth: 12,
      percent: score,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: const Color(0xff7CC0DA),
      backgroundColor: Colors.grey.shade200,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${(score * 100).toInt()}%",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff7CC0DA),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "النتيجة",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
