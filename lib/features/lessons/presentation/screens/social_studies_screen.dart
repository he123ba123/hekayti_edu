import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/color_manager/app_colors.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';
import 'package:hekayti/features/home/logic/navigation_cubit.dart';
import 'package:hekayti/features/home/presentation/screens/main_screen_args.dart';

class SocialStudiesScreen extends StatelessWidget {
  const SocialStudiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.mainBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "الدراسات الاجتماعية",
          style: TextStyleManager.font20Bold.copyWith(
            color: AppColors.mainBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.all(24.w),
          itemCount: 4,
          separatorBuilder: (context, index) => SizedBox(height: 24.h),
          itemBuilder: (context, index) {
            return _buildUnitCard(context, index + 1);
          },
        ),
      ),
    );
  }

  Widget _buildUnitCard(BuildContext context, int unitNumber) {
    // Determine unit color based on unit number for visual variety
    final Color unitColor = [
      AppColors.primaryColor,
      const Color(0xFFFFB347),
      const Color(0xFF4CAF50),
      const Color(0xFF9C27B0),
    ][(unitNumber - 1) % 4];

    final String unitTitle = [
      "بيئتي ومجتمعي",
      "تاريخنا العريق",
      "جغرافية وطني",
      "الاقتصاد والموارد",
    ][(unitNumber - 1) % 4];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Unit Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: unitColor.withOpacity(0.1),
              border: Border(
                bottom: BorderSide(color: unitColor.withOpacity(0.2), width: 1),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: unitColor.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    "$unitNumber",
                    style: TextStyleManager.font20Bold.copyWith(
                      color: unitColor,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الوحدة $unitNumber",
                        style: TextStyleManager.font12Bold.copyWith(
                          color: unitColor,
                        ),
                      ),
                      Text(
                        unitTitle,
                        style: TextStyleManager.font18SemiBold.copyWith(
                          color: AppColors.mainBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Lessons List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              indent: 20.w,
              endIndent: 20.w,
              color: Colors.grey[200],
            ),
            itemBuilder: (context, index) {
              return _buildLessonItem(
                context,
                unitNumber,
                index + 1,
                unitColor,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLessonItem(
    BuildContext context,
    int unitNumber,
    int lessonNumber,
    Color color,
  ) {
    // Unlock the first three lessons of the first unit
    final bool isUnlocked = unitNumber == 1 && lessonNumber <= 3;
    final bool isLocked = !isUnlocked;

    return InkWell(
      onTap: isLocked
          ? null
          : () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainScreen,
                (route) => false,
                arguments: MainScreenArgs(
                  initialTab: NavigationTab.stories,
                  initialLessonId: lessonNumber,
                ),
              );
            },
      child: Container(
        color: isLocked ? Colors.grey[50] : Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: isLocked ? Colors.grey[200] : color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
                border: isLocked
                    ? Border.all(color: Colors.grey[300]!)
                    : Border.all(color: color.withOpacity(0.3)),
              ),
              child: Icon(
                isLocked
                    ? Icons.lock_outline_rounded
                    : Icons.play_arrow_rounded,
                color: isLocked ? Colors.grey[500] : color,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "الدرس $lessonNumber",
                        style: TextStyleManager.font12Medium.copyWith(
                          color: isLocked ? Colors.grey[400] : color,
                          fontWeight: isLocked
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                      if (!isLocked) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "مفتوح",
                            style: TextStyleManager.font10Bold.copyWith(
                              color: Colors.white,
                              fontSize: 8.sp,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "عنوان الدرس التعليمي $lessonNumber",
                    style: TextStyleManager.font14Bold.copyWith(
                      color: isLocked ? Colors.grey[400] : AppColors.mainBlack,
                    ),
                  ),
                  if (isLocked)
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        "يتطلب اشتراك مدفوع",
                        style: TextStyleManager.font10Bold.copyWith(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (!isLocked)
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14.sp,
                      color: color,
                    ),
                  ),
                ],
              )
            else
              Icon(
                Icons.lock_clock_outlined,
                size: 18.sp,
                color: Colors.grey[300],
              ),
          ],
        ),
      ),
    );
  }
}
