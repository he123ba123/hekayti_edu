import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';
import 'package:hekayti/features/auth/presentation/widgets/auth_text_field.dart';
import '../cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1A1F36)),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, Routes.welcomeScreen),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoggedIn) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainScreen,
                    (route) => false,
              );
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errors.join(', '))),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  // Header
                  Center(
                    child: Container(
                      width: 80.r,
                      height: 80.r,
                      decoration: BoxDecoration(
                        color: const Color(0xFF90D5EC).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.lock_person_outlined,
                        color: const Color(0xFF90D5EC),
                        size: 40.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text("مرحباً بك مجدداً!", style: TextStyleManager.font24Bold),
                  SizedBox(height: 8.h),
                  Text(
                    "سجل دخولك لمتابعة مغامراتك التعليمية",
                    style: TextStyleManager.font14Regular.copyWith(
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 48.h),

                  // Form
                  AuthTextField(
                    controller: emailController,
                    hintText: "البريد الإلكتروني",
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(height: 20.h),
                  AuthTextField(
                    controller: passwordController,
                    hintText: "كلمة المرور",
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  SizedBox(height: 12.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "نسيت كلمة المرور؟",
                        style: TextStyleManager.font12Bold.copyWith(
                          color: const Color(0xFF90D5EC),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: state is AuthLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().login(
                          email: emailController.text.trim(),
                          password: passwordController.text,
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
                        "تسجيل الدخول",
                        style: TextStyleManager.font16Bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // Divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[200])),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          "أو سجل عبر",
                          style: TextStyleManager.font12Regular.copyWith(
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey[200])),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  // Social Logins
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(Icons.g_mobiledata, () {}),
                      SizedBox(width: 20.w),
                      _socialButton(Icons.apple, () {}),
                      SizedBox(width: 20.w),
                      _socialButton(Icons.facebook, () {}),
                    ],
                  ),

                  SizedBox(height: 48.h),

                  // Signup switch
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.signupScreen,
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyleManager.font14Regular.copyWith(
                            color: Colors.grey[500],
                          ),
                          children: [
                            const TextSpan(text: "ليس لديك حساب؟ "),
                            TextSpan(
                              text: "أنشئ حساباً جديداً",
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
            );
          },
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[100]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: const Color(0xFF4A5568), size: 28.sp),
      ),
    );
  }
}
