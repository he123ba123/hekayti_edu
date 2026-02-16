import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/color_manager/app_colors.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';
import 'package:hekayti/features/home/logic/navigation_cubit.dart';
import '../widgets/age_selection_card.dart';
import '../widgets/subject_selection_card.dart';

class LessonSelectionScreen extends StatefulWidget {
  const LessonSelectionScreen({super.key});

  @override
  State<LessonSelectionScreen> createState() => _LessonSelectionScreenState();
}

class _LessonSelectionScreenState extends State<LessonSelectionScreen> {
  int _selectedAgeIndex = 1;
  int _selectedSubjectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "اختر درسك",
          style: TextStyleManager.font18SemiBold.copyWith(
            color: AppColors.mainBlack,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "اختر عمرك وابدأ مغامرة قصتك!",
                        style: TextStyleManager.font14Bold.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // Age Selection
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Row(
                        children: List.generate(7, (index) {
                          final age = index + 4;
                          final isSelected = _selectedAgeIndex == index;

                          // Cycle through 3 styles
                          final colors = [
                            const Color(0xFFFFF7E6),
                            const Color(0xFFE6F7FF),
                            const Color(0xFFFFF0F6),
                          ];
                          final iconColors = [
                            const Color(0xFFFFB347),
                            const Color(0xFF1890FF),
                            const Color(0xFFEB2F96),
                          ];
                          final icons = [
                            Icons.star_rounded,
                            Icons.rocket_launch_rounded,
                            Icons.menu_book_rounded,
                          ];

                          return Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: AgeSelectionCard(
                              title: "$age",
                              subtitle: "سنوات",
                              icon: icons[index % icons.length],
                              backgroundColor: colors[index % colors.length],
                              iconColor: iconColors[index % iconColors.length],
                              isSelected: isSelected,
                              onTap: () =>
                                  setState(() => _selectedAgeIndex = index),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // Subjects Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F7F9),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Column(
                        children: [
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.w,
                            crossAxisSpacing: 16.w,
                            childAspectRatio: 1.1,
                            children: [
                              SubjectSelectionCard(
                                title: "دراسات اجتماعية",
                                icon: Icons.language,
                                iconBackgroundColor: const Color(0xFFE6F0FF),
                                iconColor: const Color(0xFF4A90E2),
                                isSelected: _selectedSubjectIndex == 0,
                                onTap: () {
                                  setState(() => _selectedSubjectIndex = 0);
                                  Navigator.pushNamed(
                                    context,
                                    Routes.socialStudiesScreen,
                                  );
                                },
                              ),
                              SubjectSelectionCard(
                                title: "رياضيات",
                                icon: Icons.calculate,
                                iconBackgroundColor: const Color(0xFFFFF2E6),
                                iconColor: const Color(0xFFF5A623),
                                isSelected: _selectedSubjectIndex == 1,
                                onTap: () =>
                                    setState(() => _selectedSubjectIndex = 1),
                              ),
                              SubjectSelectionCard(
                                title: "علوم",
                                icon: Icons.biotech,
                                iconBackgroundColor: const Color(0xFFE6FFF2),
                                iconColor: const Color(0xFF50E3C2),
                                isSelected: _selectedSubjectIndex == 2,
                                onTap: () =>
                                    setState(() => _selectedSubjectIndex = 2),
                              ),
                              SubjectSelectionCard(
                                title: "عربي",
                                icon: Icons.edit_note,
                                iconBackgroundColor: const Color(0xFFE6F9FF),
                                iconColor: const Color(0xFF72CAED),
                                isSelected: _selectedSubjectIndex == 3,
                                onTap: () =>
                                    setState(() => _selectedSubjectIndex = 3),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          // General Information
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3E6FF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.lightbulb,
                                    size: 20.sp,
                                    color: const Color(0xFF9013FE),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "معلومات عامة",
                                  style: TextStyleManager.font14Bold,
                                ),
                                SizedBox(width: 12.w),
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 14.sp,
                                  color: const Color(0xFFE6E6E6),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // Start Button
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ابدأ قصتي",
                              style: TextStyleManager.font18SemiBold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.auto_awesome, size: 20.sp),
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
    );
  }
}
