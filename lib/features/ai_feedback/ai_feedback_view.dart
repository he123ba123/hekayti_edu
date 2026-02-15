import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/features/ai_feedback/widgets/good_concepts.dart';
import 'package:hekayti/features/ai_feedback/widgets/main_review.dart';
import 'package:hekayti/features/ai_feedback/widgets/need_review_card.dart';
import 'package:hekayti/features/ai_feedback/widgets/primary_button.dart';
import 'package:hekayti/features/ai_feedback/widgets/rounded_card.dart';
import 'package:hekayti/features/ai_feedback/widgets/secondary_button.dart';
import 'package:hekayti/features/ai_feedback/widgets/top_bar.dart';

class AiFeedbackView extends StatelessWidget {
  const AiFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// TOP BAR
              TopBar(),
               SizedBox(height: 20.h),
              MainReview(),
              /// FEEDBACK CARD
              RoundedCard(
                child: const Text(
                  "لقد استوعبت جوهر القصة بشكل مذهل. قدرتك على\nربط الأحداث ببعضها كانت رائعة اليوم!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ),

               SizedBox(height: 20.h),
              /// GOOD CONCEPTS CARD
              GoodConcepts(),
               SizedBox(height: 20.h),
              /// NEED REVIEW CARD
              NeedReviewCard(),
               SizedBox(height: 16.h,),
              /// PRIMARY BUTTON
              PrimaryButton(),
               SizedBox(height: 15.h),
              SecondaryButton(),
               SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}