import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hekayti/core/extentions/navigation.dart';

import '../../../core/routing/routes.dart';
import 'circle_icon.dart';

class BottomControl extends StatefulWidget {
  const BottomControl({super.key});

  @override
  State<BottomControl> createState() => _BottomControlState();
}

class _BottomControlState extends State<BottomControl> {
  bool isPaused = false;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          CircleIcon(
            icon: Icons.auto_fix_high,
            backgroundColor: Colors.white,
            iconColor: Colors.black54,
          ),

          /// Stop Button
          GestureDetector(
            onTap: (){
              context.pushWithNamed(Routes.aiFeedbackView);
            },
            child: Container(
              width: 90.w,
              height: 90.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff5BA9C9),
              ),
              child: const Icon(
                Icons.stop,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              setState(() {
                isPaused = !isPaused;
              });
            },
            child: CircleIcon(
              icon: isPaused ? Icons.play_arrow : Icons.pause,
              backgroundColor: Colors.white,
              iconColor: Colors.black54,
            ),
          ),

        ],
      ),
    );
  }
}
