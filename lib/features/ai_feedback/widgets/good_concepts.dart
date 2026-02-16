import 'package:flutter/material.dart';
import 'package:hekayti/features/ai_feedback/widgets/rounded_card.dart';
import 'package:hekayti/features/ai_feedback/widgets/section_tile.dart';

import 'checked_item.dart';

class GoodConcepts extends StatelessWidget {
  const GoodConcepts({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle(text: 'ذكرت هذه المفاهيم', icon: Icons.verified, color:  Colors.green,),

          SizedBox(height: 15),
          CheckedItem(text: 'الشجاعة في مواجهة التحديات',),
          CheckedItem(text: 'أهمية العمل الجماعي',),
          CheckedItem(text: 'مساعدة الآخرين وقت الحاجة',),
        ],
      ),
    );
  }
}
