import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/features/voice_recording/widgets/bottom_control.dart';
import 'package:hekayti/features/voice_recording/widgets/mic_circle.dart';
import 'package:hekayti/features/voice_recording/widgets/progress_bar.dart';
import 'package:hekayti/features/voice_recording/widgets/story_card.dart';
import 'package:hekayti/features/voice_recording/widgets/timer_container.dart';
import 'package:hekayti/features/voice_recording/widgets/voice_recording_header.dart';

class VoiceRecordingView extends StatelessWidget {
  const VoiceRecordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              VoiceRecordingHeader(),
               SizedBox(height: 20.h),
              /// Title
              const Text(
                "جاهز تحكي؟",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
               SizedBox(height: 8.h),
          
              const Text(
                "جاري الاستماع الآن...",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff5BA9C9),
                ),
              ),
               SizedBox(height: 40.h),
              /// Big Mic Circle
              MicCircle(),
               SizedBox(height: 40.h),
              /// Story Card
              StoryCard(),
               SizedBox(height: 25.h),
              /// Timer
              TimerContainer(),
               SizedBox(height: 20.h),
              /// Progress Bar
              ProgressBar(),
              SizedBox(height: 16,),
              /// Bottom Controls
              BottomControl(),
          
              const Text(
                "قصتك رائعة، استمر في الكلام!",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
               SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
