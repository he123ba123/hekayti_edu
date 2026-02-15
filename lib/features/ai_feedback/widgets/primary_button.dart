import 'package:flutter/material.dart';
import 'package:hekayti/core/extentions/navigation.dart';

import '../../../core/routing/routes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushWithNamed(Routes.quizView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xff6BB3CE),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.rocket_launch, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  "ابدأ التحدي",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
