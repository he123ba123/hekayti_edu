import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';
import '../widgets/story_header.dart';
import '../widgets/story_progress_bar.dart';
import '../widgets/story_content_card.dart';
import '../widgets/story_control_bar.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            StoryHeader(
              title: "مغامرة يوسف",
              onClose: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 30.h),
            const StoryProgressBar(),
            SizedBox(height: 30.h),
            const StoryContentCard(),
            SizedBox(height: 30.h),
            StoryControlBar(
              onNext: () {
                // TODO: Handle next
              },
              onExplain: () {
                // TODO: Handle explain
              },
              onSpeak: () {
                // TODO: Handle speak
              },
            ),
            SizedBox(height: 10.h),
            Text(
              "اسحب البطاقة لليسار لمشاهدة الجزء السابق",
              style: TextStyleManager.font10Bold.copyWith(
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
