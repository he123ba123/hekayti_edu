import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/color_manager/app_colors.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(
          "جوائزي",
          style: TextStyleManager.font20Bold.copyWith(
            color: AppColors.mainBlack,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section - Level & Progress
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2575FC).withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "المستوى 5",
                              style: TextStyleManager.font14Bold.copyWith(
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "مستكشف صغير",
                              style: TextStyleManager.font24Bold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.emoji_events_rounded,
                            color: Colors.white,
                            size: 40.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    // Progress Bar
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "1200 نقطة",
                              style: TextStyleManager.font12Bold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "1500 هدف",
                              style: TextStyleManager.font12Bold.copyWith(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: LinearProgressIndicator(
                            value: 0.8,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFFFD700),
                            ),
                            minHeight: 8.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              // Title Section for Badges
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الإنجازات",
                    style: TextStyleManager.font18SemiBold.copyWith(
                      color: const Color(0xFF1A1F36),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "5 / 12",
                      style: TextStyleManager.font12Bold.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Rewards Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16.w,
                crossAxisSpacing: 16.w,
                childAspectRatio: 0.85,
                children: [
                  _buildRewardCard(
                    "قارئ مبتدئ",
                    "أنهيت 5 قصص",
                    Icons.menu_book_rounded,
                    true,
                    const Color(0xFF4CAF50),
                  ),
                  _buildRewardCard(
                    "مستمع جيد",
                    "استمعت لمدة ساعة",
                    Icons.headphones_rounded,
                    true,
                    const Color(0xFF2196F3),
                  ),
                  _buildRewardCard(
                    "سوبر ستار",
                    "حصلت على 5 نجوم",
                    Icons.star_rounded,
                    true,
                    const Color(0xFFFFC107),
                  ),
                  _buildRewardCard(
                    "مغامر شجاع",
                    "أنهيت قصة الغابة",
                    Icons.forest_rounded,
                    false, // Locked
                    Colors.grey,
                  ),
                  _buildRewardCard(
                    "عالم صغير",
                    "أنهيت درس العلوم",
                    Icons.science_rounded,
                    false, // Locked
                    Colors.grey,
                  ),
                  _buildRewardCard(
                    "فنان مبدع",
                    "رسمت لوحة جميلة",
                    Icons.palette_rounded,
                    false, // Locked
                    Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 100.h), // Bottom padding for nav bar
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRewardCard(
    String title,
    String desc,
    IconData icon,
    bool unlocked,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        border: unlocked
            ? Border.all(color: color.withOpacity(0.3), width: 1.5)
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: unlocked ? color.withOpacity(0.1) : Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              unlocked ? icon : Icons.lock_outline_rounded,
              size: 32.sp,
              color: unlocked ? color : Colors.grey[400],
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyleManager.font14Bold.copyWith(
              color: unlocked ? const Color(0xFF1A1F36) : Colors.grey[400],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            desc,
            style: TextStyleManager.font12Medium.copyWith(
              color: Colors.grey[400],
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
