import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/color_manager/app_colors.dart';
import 'package:hekayti/core/constants/app_assets.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';

class ChildSetupScreen extends StatefulWidget {
  const ChildSetupScreen({super.key});

  @override
  State<ChildSetupScreen> createState() => _ChildSetupScreenState();
}

class _ChildSetupScreenState extends State<ChildSetupScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 90.h),
        child: FloatingActionButton(
          onPressed: () {
          },
          backgroundColor: AppColors.primaryColor,
          elevation: 6,
          tooltip: 'Chat with AI',
          child: const Icon(Icons.forum_outlined, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),

              // Layout dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(false),
                  SizedBox(width: 8.w),
                  _buildDot(true),
                ],
              ),
              SizedBox(height: 40.h),

              // Avatar
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 180.r,
                    height: 180.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryLightColor,
                    ),
                  ),
                  Image.asset(AppAssets.splash, height: 180.h),
                ],
              ),
              SizedBox(height: 20.h),

              // Greeting
              Text(
                "أهلاً بك في حكايتي",
                style: TextStyleManager.font28Bold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                "دعنا نجهز ملف طفلك التعليمي لنبدأ المغامرة!",
                style: TextStyleManager.font14Medium.copyWith(
                  color: AppColors.greyColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),

              // Name Input
              Align(
                alignment: Alignment.centerRight,
                child: Text("ما اسم طفلك؟", style: TextStyleManager.font16Bold),
              ),
              SizedBox(height: 12.h),
              TextField(
                controller: _nameController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "اكتب اسم طفلك هنا...",
                  hintStyle: TextStyleManager.font14Regular.copyWith(
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                  filled: true,
                  fillColor: AppColors.primaryLightColor.withOpacity(0.3),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showMaterialChoiceModal(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "استمرار",
                    style: TextStyleManager.font18SemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Footer
              TextButton(
                onPressed: () {},
                child: Text(
                  "يمكنك تخطي هذه الخطوة وإضافة المحتوى لاحقاً",
                  style: TextStyleManager.font12Bold.copyWith(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  void _showMaterialChoiceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(32.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "كيف تحب أن تبدأ؟",
                style: TextStyleManager.font20Bold.copyWith(
                  color: AppColors.mainBlack,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                "اختر الطريقة التي تفضلها لتجهيز محتوى طفلك",
                style: TextStyleManager.font14Medium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              _buildChoiceOption(
                title: "تحميل ملفاتي الخاصة",
                description: "سأقوم بتحميل الصور أو الملفات التي اخترتها",
                icon: Icons.cloud_upload_outlined,
                color: AppColors.primaryColor,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routes.uploadMaterialScreen);
                },
              ),
              SizedBox(height: 16.h),
              _buildChoiceOption(
                title: "اختر من دروسنا",
                description: "تصفح مكتبة دروسنا الجاهزة والممتعة",
                icon: Icons.auto_stories_outlined,
                color: const Color(0xFF9013FE),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routes.lessonSelectionScreen);
                },
              ),
              SizedBox(height: 32.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChoiceOption({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: color.withAlpha(50), width: 1.5.w),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyleManager.font16Bold.copyWith(color: color),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyleManager.font12Bold.copyWith(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_back_ios,
              color: color.withOpacity(0.3),
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.h,
      width: isActive ? 40.w : 12.w,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryColor
            : AppColors.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
