import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/color_manager/app_colors.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';
import 'package:hekayti/features/settings/presentation/widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "الإعدادات",
          style: TextStyleManager.font20Bold.copyWith(
            color: const Color(0xFF1A1F36),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Section
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                      child: Icon(
                        Icons.person_rounded,
                        size: 32.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "أحمد محمد",
                          style: TextStyleManager.font18SemiBold.copyWith(
                            color: const Color(0xFF1A1F36),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "تعديل الملف الشخصي",
                          style: TextStyleManager.font12Medium.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // General Settings
              Text(
                "عام",
                style: TextStyleManager.font14Bold.copyWith(
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(height: 12.h),

              SettingsTile(
                icon: Icons.notifications_active_outlined,
                iconColor: const Color(0xFFE91E63),
                title: "الإشعارات",
                subtitle: "إدارة تفضيلات الإشعارات",
                onTap: () {},
                trailing: Switch(
                  value: true,
                  onChanged: (val) {},
                  activeColor: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 10.h),
              SettingsTile(
                icon: Icons.volume_up_outlined,
                iconColor: const Color(0xFF9C27B0),
                title: "الأصوات",
                subtitle: "تخصيص أصوات التطبيق",
                onTap: () {},
              ),

              SizedBox(height: 24.h),

              // Support Section
              Text(
                "الدعم والمساعدة",
                style: TextStyleManager.font14Bold.copyWith(
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(height: 12.h),

              SettingsTile(
                icon: Icons.language,
                iconColor: const Color(0xFF00BCD4),
                title: "تغيير اللغة",
                subtitle: "العربية",
                onTap: () {},
              ),
              SizedBox(height: 10.h),
              SettingsTile(
                icon: Icons.security,
                iconColor: const Color(0xFF4CAF50),
                title: "سياسة الخصوصية",
                onTap: () {},
              ),
              SizedBox(height: 10.h),
              SettingsTile(
                icon: Icons.help_outline,
                iconColor: const Color(0xFFFF9800),
                title: "تواصل معنا",
                onTap: () {},
              ),

              SizedBox(height: 30.h),

              // Logout Button
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.loginScreen,
                    (route) => false,
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.red.withOpacity(0.2)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.red[700],
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "تسجيل الخروج",
                        style: TextStyleManager.font16SemiBold.copyWith(
                          color: Colors.red[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
