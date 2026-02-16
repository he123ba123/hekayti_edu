import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';

class RewardCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isUnlocked;
  final Color baseColor;

  const RewardCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.isUnlocked = false,
    this.baseColor = const Color(0xFFFF4081),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: stdColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: isUnlocked
                ? baseColor.withOpacity(0.2)
                : Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        border: isUnlocked
            ? Border.all(color: baseColor.withOpacity(0.3), width: 1)
            : Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: isUnlocked ? baseColor.withOpacity(0.1) : Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              isUnlocked ? icon : Icons.lock_outline_rounded,
              size: 32.sp,
              color: isUnlocked ? baseColor : Colors.grey[400],
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyleManager.font16Bold.copyWith(
              color: isUnlocked ? const Color(0xFF1A1F36) : Colors.grey[500],
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            description,
            style: TextStyleManager.font12Medium.copyWith(
              color: isUnlocked ? Colors.grey[600] : Colors.grey[400],
              fontSize: 11.sp,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Color get stdColor => Colors.white;
}
