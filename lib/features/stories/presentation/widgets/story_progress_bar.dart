import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const StoryProgressBar({
    super.key,
    this.totalSteps = 5,
    this.currentStep = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(totalSteps, (index) {
              if (index == 2) {
                return Icon(
                  Icons.star_rounded,
                  color: const Color(0xFF90D5EC),
                  size: 36.sp,
                );
              }
              return _buildProgressDot(index <= currentStep);
            }),
          ),
          // Progress Fill
          Positioned(
            left: 0,
            right: 180
                .w,
            child: Container(
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFF90D5EC),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressDot(bool isActive) {
    return Container(
      width: 10.r,
      height: 10.r,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF90D5EC) : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF90D5EC).withOpacity(0.2),
          width: 2,
        ),
      ),
    );
  }
}
