import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/constants/app_assets.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8FBFF), Color(0xFFE6F3FF), Color(0xFFF0F7FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Decorative background icons (placeholders)
              _buildBackgroundIcon(
                Icons.star_rounded,
                top: 100.h,
                left: 40.w,
                color: const Color(0xFFFFD700).withOpacity(0.3),
                size: 24,
              ),
              _buildBackgroundIcon(
                Icons.auto_stories,
                top: 350.h,
                left: 30.w,
                color: const Color(0xFFB3E5FC),
                size: 40,
              ),
              _buildBackgroundIcon(
                Icons.star_rounded,
                top: 80.h,
                right: 60.w,
                color: const Color(0xFFB3E5FC),
                size: 20,
              ),

              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildHeaderIcon(Icons.help_outline),
                          Text(
                            "حكايتي",
                            style: TextStyleManager.font18SemiBold.copyWith(
                              color: const Color(0xFF4FC3F7),
                              letterSpacing: 1.2,
                            ),
                          ),
                          _buildHeaderIcon(Icons.language_outlined),
                        ],
                      ),

                      SizedBox(height: 30.h),

                      // Logo Container
                      Container(
                        width: 200.r,
                        height: 200.r,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 170.r,
                            height: 170.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              AppAssets.splash,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 40.h),

                      // Typography Section
                      Text(
                        "عالم من الخيال",
                        style: TextStyleManager.font32Bold.copyWith(
                          color: const Color(0xFF1A1F36),
                        ),
                      ),
                      Text(
                        "ينتظر طفلك",
                        style: TextStyleManager.font32Bold.copyWith(
                          color: const Color(0xFF4FC3F7),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_copy_outlined,
                            size: 16.sp,
                            color: Colors.grey[400],
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "نحوّل الدروس إلى مغامرات",
                            style: TextStyleManager.font14Medium.copyWith(
                              color: const Color(0xFF4A5568),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        "\"حيث تصبح كل قصة رحلة تعليمية فريدة\"",
                        style: TextStyleManager.font12Bold.copyWith(
                          color: Colors.grey[400],
                        ),
                      ),

                      SizedBox(height: 40.h),

                      // Preview Images
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildPreviewCircle(AppAssets.splash),
                          SizedBox(width: 12.w),
                          _buildPreviewCircle(AppAssets.splash, isLarger: true),
                          SizedBox(width: 12.w),
                          _buildPreviewCircle(AppAssets.splash),
                        ],
                      ),

                      SizedBox(height: 48.h),

                      // Action Button
                      SizedBox(
                        width: double.infinity,
                        height: 60.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signupScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF90D5EC),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 12.w),
                              Text(
                                "ابدأ المغامرة",
                                style: TextStyleManager.font18SemiBold,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 32.h),

                      // Statistics
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem("١٠٠+", "قصة ذكية"),
                          _buildStatItem("٤.٩", "تقييم الآباء"),
                          _buildStatItem("آمن", "١٠٠٪ للأطفال"),
                        ],
                      ),

                      SizedBox(height: 40.h),

                      // Footer
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.loginScreen);
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyleManager.font14Medium.copyWith(
                              color: const Color(0xFF4FC3F7),
                            ),
                            children: [
                              TextSpan(
                                text: "لديك حساب بالفعل؟ ",
                                style: TextStyleManager.font14Medium.copyWith(
                                  color: Colors.grey[400],
                                ),
                              ),
                              const TextSpan(text: "تسجيل الدخول"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Icon(icon, size: 20.sp, color: Colors.grey[400]),
    );
  }

  Widget _buildPreviewCircle(String asset, {bool isLarger = false}) {
    double size = isLarger ? 80.r : 70.r;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(asset, fit: BoxFit.cover),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyleManager.font16Bold.copyWith(
            color: const Color(0xFF1A1F36),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyleManager.font10Bold.copyWith(color: Colors.grey[400]),
        ),
      ],
    );
  }

  Widget _buildBackgroundIcon(
    IconData icon, {
    double? top,
    double? left,
    double? right,
    double? bottom,
    required Color color,
    required double size,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Icon(icon, color: color, size: size.sp),
    );
  }
}
