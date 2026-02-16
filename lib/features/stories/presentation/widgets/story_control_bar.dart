import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';

class StoryControlBar extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onExplain;
  final VoidCallback onSpeak;
  final bool isLastPart;

  const StoryControlBar({
    super.key,
    required this.onNext,
    required this.onExplain,
    required this.onSpeak,
    this.isLastPart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          // Next Button
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onNext,
              child: Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF90D5EC),
                  borderRadius: BorderRadius.circular(35.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isLastPart
                          ? Icons.check_rounded
                          : Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      isLastPart ? "إنهاء" : "التالي",
                      style: TextStyleManager.font18SemiBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          // Explain Button
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onExplain,
              child: Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35.r),
                  border: Border.all(color: Colors.grey[100]!),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      color: const Color(0xFF90D5EC),
                      size: 20.sp,
                    ),
                    Text(
                      "شرح بطريقة مختلفة",
                      style: TextStyleManager.font10Bold,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          // Mic Button (Ahki)
          GestureDetector(
            onTap: onSpeak,
            child: Container(
              width: 70.r,
              height: 70.r,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mic_none,
                    color: const Color(0xFF90D5EC),
                    size: 28.sp,
                  ),
                  Text(
                    "احكي",
                    style: TextStyleManager.font10Bold.copyWith(
                      color: const Color(0xFF90D5EC),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
