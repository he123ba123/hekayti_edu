import 'package:flutter/material.dart';
import 'package:hekayti/features/ai_feedback/widgets/rounded_card.dart';
import 'package:hekayti/features/ai_feedback/widgets/section_tile.dart';
import 'package:hekayti/features/ai_feedback/widgets/uncheck_item.dart';

class NeedReviewCard extends StatelessWidget {
  const NeedReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  RoundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle( text: 'تحتاج مراجعة', icon: Icons.more_horiz, color: Colors.grey,),

          SizedBox(height: 15),
          UncheckItem(text: 'تطور شخصية البطل الرئيسية',),
          UncheckItem(text: 'الدروس المستفادة من نهاية القصة',),
        ],
      ),
    );
  }
}
