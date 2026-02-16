import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/color_manager/app_colors.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';

class UploadDropzone extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;

  const UploadDropzone({
    super.key,
    required this.hintText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          color: AppColors.primaryLightColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.3),
            width: 1.5.w,
            style: BorderStyle
                .solid, // Note: For dashed effect, a custom painter would be better but keeping it simple for now or using a package if available.
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_upload,
              size: 40.sp,
              color: AppColors.primaryColor.withOpacity(0.5),
            ),
            SizedBox(height: 8.h),
            Text(
              hintText,
              style: TextStyleManager.font14Medium.copyWith(
                color: AppColors.primaryColor.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
