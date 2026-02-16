import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/core/text_style_manager/text_style_manager.dart';
import 'package:hekayti/features/stories/logic/story_cubit.dart';
import '../widgets/story_header.dart';
import '../widgets/story_progress_bar.dart';
import '../widgets/story_content_card.dart';
import '../widgets/story_control_bar.dart';

class StoryScreen extends StatefulWidget {
  final int? lessonId;
  const StoryScreen({super.key, this.lessonId});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.lessonId != null) {
      context.read<StoryCubit>().getStory(widget.lessonId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      body: SafeArea(
        child: BlocBuilder<StoryCubit, StoryState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 20.h),
                StoryHeader(
                  title: "مغامرة يوسف",
                  onClose: () {
                    // Navigator.pop(context);
                  },
                ),
                SizedBox(height: 30.h),
                StoryProgressBar(
                  totalSteps: state.storyParts.length,
                  currentStep: state.currentIndex,
                ),
                SizedBox(height: 30.h),
                if (state.status == StoryStatus.loading)
                  Expanded(child: Center(child: CircularProgressIndicator()))
                else if (state.status == StoryStatus.error)
                  Expanded(
                    child: Center(child: Text(state.errorMessage ?? "Error")),
                  )
                else
                  Expanded(
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! > 0) {
                          // Swipe Right
                          context.read<StoryCubit>().nextPart();
                        } else if (details.primaryVelocity! < 0) {
                          // Swipe Left
                          context.read<StoryCubit>().previousPart();
                        }
                      },
                      child: StoryContentCard(
                        text: state.currentPart,
                        imagePath: state.currentImagePath,
                      ),
                    ),
                  ),
                SizedBox(height: 30.h),
                StoryControlBar(
                  isLastPart: state.currentIndex == state.storyParts.length - 1,
                  onNext: () {
                    if (state.currentIndex == state.storyParts.length - 1) {
                      Navigator.pushNamed(context, Routes.voiceRecordingView);
                    } else {
                      context.read<StoryCubit>().nextPart();
                    }
                  },
                  onExplain: () {
                    // TODO: Handle explain
                  },
                  onSpeak: () {
                    Navigator.pushNamed(context, Routes.voiceRecordingView);
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
            );
          },
        ),
      ),
    );
  }
}
