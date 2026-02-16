import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'circle_icon.dart';

class VoiceRecordingHeader extends StatelessWidget {
  const VoiceRecordingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return        Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleIcon(
            icon: Icons.question_mark,
            backgroundColor: const Color(0xffCFE8F3),
            iconColor: const Color(0xff5BA9C9),
          ),
          const Text(
            "حكايتي",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          CircleIcon(
            icon: Icons.close,
            backgroundColor: Colors.white,
            iconColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
