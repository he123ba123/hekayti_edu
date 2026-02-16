import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';

class StoryContentCard extends StatelessWidget {
  const StoryContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            // Image Placeholder
            Container(
              width: 280.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 50.sp,
                  color: Colors.grey[300],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            // Text Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 4.w,
                    runSpacing: 8.h,
                    children: [
                      _buildTextPart("بينما"),
                      _buildTextPart("كان"),
                      _buildHighlightedText(
                        "يوسف",
                        color: const Color(0xFF90D5EC),
                      ),
                      _buildTextPart("يمشي"),
                      _buildTextPart("في"),
                      _buildHighlightedText("الغابة", isBoxed: true),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text("الكثيفة، وجد", style: TextStyleManager.font16Bold),
                  SizedBox(height: 12.h),
                  _buildHighlightedText("عصفوراً", isBoxed: true),
                  SizedBox(height: 12.h),
                  Text(
                    "صغيراً ملوناً يحاول الطيران.",
                    style: TextStyleManager.font16Bold,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "قال يوسف: لا تقلق أيها العصفور، سأساعدك لتجد عشك.",
                    style: TextStyleManager.font14Medium.copyWith(
                      color: Colors.grey[400],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Audio Wave Placeholder
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTextPart(String text) {
    return Text(
      text,
      style: TextStyleManager.font20Bold.copyWith(
        color: const Color(0xFF1A1F36),
      ),
    );
  }

  Widget _buildHighlightedText(
    String text, {
    Color? color,
    bool isBoxed = false,
  }) {
    if (isBoxed) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: const Color(0xFF90D5EC).withOpacity(0.15),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          text,
          style: TextStyleManager.font20Bold.copyWith(
            color: const Color(0xFF1A1F36),
          ),
        ),
      );
    }
    return Text(
      text,
      style: TextStyleManager.font20Bold.copyWith(
        color: color ?? const Color(0xFF1A1F36),
      ),
    );
  }
}
