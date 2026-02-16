import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/color_manager/app_colors.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';
import 'package:hekayti/features/home/logic/navigation_cubit.dart';
import 'package:hekayti/features/stories/presentation/screens/story_screen.dart';
import 'package:hekayti/features/lessons/presentation/screens/child_setup_screen.dart';
import 'package:hekayti/features/settings/presentation/screens/settings_screen.dart';
import 'package:hekayti/features/rewards/presentation/screens/rewards_screen.dart';

import 'package:hekayti/core/network/api_service.dart';
import 'package:hekayti/features/stories/data/data_sources/story_remote_data_source.dart';

import 'package:hekayti/features/stories/data/repository/story_repository_impl.dart';

import 'package:hekayti/features/stories/logic/story_cubit.dart';

class MainScreen extends StatelessWidget {
  final NavigationTab? initialTab;
  final int? initialLessonId; // Add this

  const MainScreen({super.key, this.initialTab, this.initialLessonId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NavigationCubit(initialTab ?? NavigationTab.home),
        ),
        BlocProvider(
          create: (context) {
            // Basic manual DI
            final apiService = ApiService();
            final remoteDataSource = StoryRemoteDataSourceImpl(apiService);
            final repository = StoryRepositoryImpl(remoteDataSource);
            return StoryCubit(repository);
          },
        ),
      ],
      child: BlocBuilder<NavigationCubit, NavigationTab>(
        builder: (context, activeTab) {
          return Scaffold(
            extendBody: true,
            body: _buildBody(activeTab),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(40.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 25,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavIcon(
                      context,
                      Icons.settings_outlined,
                      "الإعدادات",
                      NavigationTab.settings,
                      activeTab == NavigationTab.settings,
                    ),
                    _buildNavIcon(
                      context,
                      Icons.stars_outlined,
                      "جائزتي",
                      NavigationTab.awards,
                      activeTab == NavigationTab.awards,
                    ),
                    _buildNavIcon(
                      context,
                      Icons.menu_book,
                      "قصصي",
                      NavigationTab.stories,
                      activeTab == NavigationTab.stories,
                    ),
                    _buildNavIcon(
                      context,
                      Icons.home_outlined,
                      "الرئيسية",
                      NavigationTab.home,
                      activeTab == NavigationTab.home,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(NavigationTab tab) {
    switch (tab) {
      case NavigationTab.home:
        return const ChildSetupScreen();
      case NavigationTab.stories:
        return StoryScreen(lessonId: initialLessonId);
      case NavigationTab.awards:
        return const RewardsScreen();
      case NavigationTab.settings:
        return const SettingsScreen();
    }
  }

  Widget _buildPlaceholder(String title, Color color) {
    return Container(
      color: color.withOpacity(0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction_rounded, size: 64.sp, color: color),
            SizedBox(height: 20.h),
            Text(
              title,
              style: TextStyleManager.font24Bold.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(
    BuildContext context,
    IconData icon,
    String label,
    NavigationTab tab,
    bool isActive,
  ) {
    Color activeColor;
    Color activeBg;

    switch (tab) {
      case NavigationTab.home:
        activeColor = AppColors.buttonyColor;
        activeBg = AppColors.primaryLightColor;
      case NavigationTab.stories:
        activeColor = const Color(0xFF03A9F4);
        activeBg = const Color(0xFFE1F5FE);
      case NavigationTab.awards:
        activeColor = const Color(0xFFFF4081);
        activeBg = const Color(0xFFFCE4EC);
      case NavigationTab.settings:
        activeColor = const Color(0xFF7E57C2);
        activeBg = const Color(0xFFEDE7F6);
    }

    return GestureDetector(
      onTap: () => context.read<NavigationCubit>().changeTab(tab),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 20.w : 12.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isActive ? activeBg : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? activeColor : Colors.grey[400],
              size: 26.sp,
            ),
            if (isActive) ...[
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyleManager.font12Bold.copyWith(color: activeColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
