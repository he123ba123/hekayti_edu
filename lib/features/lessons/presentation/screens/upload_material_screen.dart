import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/color_manager/app_colors.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';
import 'package:hekayti/features/home/logic/navigation_cubit.dart';
import '../widgets/upload_type_card.dart';
import '../widgets/upload_dropzone.dart';

class UploadMaterialScreen extends StatefulWidget {
  const UploadMaterialScreen({super.key});

  @override
  State<UploadMaterialScreen> createState() => _UploadMaterialScreenState();
}

class _UploadMaterialScreenState extends State<UploadMaterialScreen> {
  int _selectedTypeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "تحميل المادة التعليمية",
          style: TextStyleManager.font18SemiBold.copyWith(
            color: AppColors.mainBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                "أضف لمستك الخاصة",
                style: TextStyleManager.font24Bold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                "قم بتحميل الملفات التي ترغب في تحويلها إلى رحلة تعليمية",
                style: TextStyleManager.font14Medium.copyWith(
                  color: AppColors.greyColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),

              // Upload Selection
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "اختر نوع الملف",
                  style: TextStyleManager.font16Bold,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UploadTypeCard(
                    title: "نص مكتوب",
                    icon: Icons.notes,
                    isSelected: _selectedTypeIndex == 0,
                    onTap: () => setState(() => _selectedTypeIndex = 0),
                  ),
                  UploadTypeCard(
                    title: "صورة",
                    icon: Icons.image,
                    isSelected: _selectedTypeIndex == 1,
                    onTap: () => setState(() => _selectedTypeIndex = 1),
                  ),
                  UploadTypeCard(
                    title: "ملف PDF",
                    icon: Icons.picture_as_pdf,
                    isSelected: _selectedTypeIndex == 2,
                    onTap: () => setState(() => _selectedTypeIndex = 2),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // Dropzone
              UploadDropzone(
                hintText: "اسحب الملفات هنا أو اضغط للاختيار",
                onTap: () {
                  // TODO: Implement file picking
                },
              ),
              const Spacer(),

              // Finish Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.mainScreen,
                      (route) => false,
                      arguments: NavigationTab.stories,
                    );
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
                    "إتمام التجهيز",
                    style: TextStyleManager.font18SemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
