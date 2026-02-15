import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: LinearProgressIndicator(
        value: 0.7,
        backgroundColor: Colors.grey.shade300,
        valueColor:
        const AlwaysStoppedAnimation(Color(0xff5BA9C9)),
        minHeight: 6,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
