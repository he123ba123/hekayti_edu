import 'package:flutter/material.dart';

class MainReview extends StatelessWidget {
  const MainReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "رائع يا بطل!",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        /// SCORE
        const Text(
          "4.8",
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Color(0xff6BB3CE),
          ),
        ),

        const SizedBox(height: 10),

        /// STARS
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
                   5,
                (index) => const Icon(
              Icons.star,
              color: Color(0xff6BB3CE),
              size: 30,
            ),
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "نتيجة مذهلة في فهم القصة",
          style: TextStyle(
            color: Color(0xff6BB3CE),
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 25),

      ],
    );
  }
}
