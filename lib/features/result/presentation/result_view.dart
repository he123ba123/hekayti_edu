import 'package:flutter/material.dart';
import  'package:hekayti/features/result/presentation/widgets/motivation_card.dart';
import 'package:hekayti/features/result/presentation/widgets/primary_button.dart';
import 'package:hekayti/features/result/presentation/widgets/result_cart.dart';
import 'package:hekayti/features/result/presentation/widgets/top_row.dart';
import 'package:hekayti/features/result/presentation/widgets/trophy_circle.dart';


class ResultView extends StatelessWidget {
  final double score; // 0.0 → 1.0

  const ResultView({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF4F7FA),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// TOP ROW
                  TopRow(),
                  const SizedBox(height: 40),
                  /// TROPHY CIRCLE
                  TrophyCircle(),
                  const SizedBox(height: 30),
                  const Text(
                    "أحسنت صنعاً!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "لقد أتممت القصة بنجاح مبهر",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
              
                  /// RESULT CARD
                  ResultCart(score: score,),
                  const SizedBox(height: 25),
                  /// MOTIVATION CARD
                  MotivationCard(),
                  SizedBox(height: 16,),
                  /// PRIMARY BUTTON
                  PrimaryButton(),
                  const SizedBox(height: 15),
              
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh),
                    label: const Text("حاول مرة أخرى"),
                  ),
              
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

