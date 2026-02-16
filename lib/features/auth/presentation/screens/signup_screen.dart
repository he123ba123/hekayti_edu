import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';
import 'package:hekayti/features/auth/presentation/widgets/auth_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1A1F36)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("إنشاء حساب جديد", style: TextStyleManager.font24Bold),
              SizedBox(height: 8.h),
              Text(
                "انضم إلينا وابدأ رحلة طفلك التعليمية اليوم",
                style: TextStyleManager.font14Regular.copyWith(
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(height: 40.h),

              // Form
              const AuthTextField(
                hintText: "الاسم الكامل",
                prefixIcon: Icons.person_outline,
              ),
              SizedBox(height: 20.h),
              const AuthTextField(
                hintText: "البريد الإلكتروني",
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: 20.h),
              const AuthTextField(
                hintText: "كلمة المرور",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              SizedBox(height: 20.h),
              const AuthTextField(
                hintText: "تأكيد كلمة المرور",
                prefixIcon: Icons.lock_clock_outlined,
                isPassword: true,
              ),

              SizedBox(height: 40.h),

              // Signup Button
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to child setup after signup
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.mainScreen,
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF90D5EC),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "إنشاء الحساب",
                    style: TextStyleManager.font16Bold,
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              // Login switch
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.loginScreen);
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyleManager.font14Regular.copyWith(
                        color: Colors.grey[500],
                      ),
                      children: [
                        const TextSpan(text: "لديك حساب بالفعل؟ "),
                        TextSpan(
                          text: "تسجيل الدخول",
                          style: TextStyleManager.font14Bold.copyWith(
                            color: const Color(0xFF90D5EC),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
