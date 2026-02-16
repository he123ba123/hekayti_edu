import 'package:flutter/material.dart';

class MotivationCard extends StatelessWidget {
  const MotivationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffE6F1F7),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: const [
          Icon(Icons.psychology,
              color: Color(0xff7CC0DA), size: 28),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "عقلية النمو",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "كل محاولة تجعلك أقوى. استمر في الاستكشاف والتعلم لتصل إلى مستويات أعلى.",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
