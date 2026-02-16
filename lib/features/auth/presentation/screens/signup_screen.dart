import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/features/auth/presentation/widgets/auth_text_field.dart';

import '../../../../core/text_style_manager/text_style_manager.dart';
import '../cubit/auth_cubit.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color(0xFF1A1F36)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthRegistered) {
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
                Text("إنشاء حساب جديد", style: TextStyleManager.font24Bold),
                SizedBox(height: 8.h),
                Text( "انضم إلينا وابدأ رحلة طفلك التعليمية اليوم", style: TextStyleManager.font14Regular.copyWith( color: Colors.grey[500], ), ),
                SizedBox(height: 40.h),
                AuthTextField(
                  controller: nameController,
                  hintText: "الاسم الكامل",
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(height: 20.h),
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
                SizedBox(height: 20.h),
                AuthTextField(
                  controller: confirmController,
                  hintText: "تأكيد كلمة المرور",
                  prefixIcon: Icons.lock_clock_outlined,
                  isPassword: true,
                ),
                SizedBox(height: 40.h),
                state is AuthLoading
                    ? Center(child: const CircularProgressIndicator())
                    : SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().register(
                        userName: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text,
                        confirmPassword: confirmController.text,
                      );
                    },
                    child: Text("إنشاء الحساب"),
                  ),
                ),
                SizedBox(height: 24.h),
                Center( child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.loginScreen);
                    },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyleManager.font14Regular.copyWith( color: Colors.grey[500], ),
                      children: [
                        const TextSpan(text: "لديك حساب بالفعل؟ "),
                        TextSpan( text: "تسجيل الدخول", style: TextStyleManager.font14Bold.copyWith( color: const Color(0xFF90D5EC),
                        ),
                        ),
                      ], ),
                  ),
                ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
