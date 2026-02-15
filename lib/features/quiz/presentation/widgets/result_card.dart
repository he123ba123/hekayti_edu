import 'package:flutter/material.dart';
import 'package:hekayti/core/extentions/navigation.dart';

import '../../../../core/routing/routes.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key, required this.isCorrect});
final bool isCorrect;
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
            onPressed: () {
              // 🔥 هنا تربطي API (submit answer / next question)
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff7BB4CC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            child: InkWell(
              onTap: (){
                context.pushWithNamed(Routes.resultView);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  const Text("السؤال التالي",style: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                  ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
