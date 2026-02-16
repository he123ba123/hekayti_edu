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
    if (totalSteps <= 0) return const SizedBox.shrink();

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
          // Progress Line Fill
          Positioned(
            left: 0,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Approximate progress - dots are spaced out evenly
                final progress = totalSteps > 1
                    ? currentStep / (totalSteps - 1)
                    : 1.0;
                return Container(
                  width: (ScreenUtil().screenWidth - 80.w) * progress,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF90D5EC),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(totalSteps, (index) {
              final bool isLast = index == totalSteps - 1;
              if (isLast && totalSteps > 1) {
                return Icon(
                  Icons.star_rounded,
                  color: index <= currentStep
                      ? const Color(0xFF90D5EC)
                      : Colors.white,
                  size: 32.sp,
                );
              }
              return _buildProgressDot(index <= currentStep);
            }),
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
        border: isActive
            ? null
            : Border.all(
                color: const Color(0xFF90D5EC).withOpacity(0.2),
                width: 2,
              ),
      ),
    );
  }
}
