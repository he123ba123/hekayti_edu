import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin:  EdgeInsets.symmetric(horizontal: 24.w),
      padding:  EdgeInsets.all(24.dm),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            '"كان يا مكان في قديم الزمان، كان هناك بطل صغير..."',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "•••",
            style: TextStyle(
              fontSize: 22,
              color: Color(0xff5BA9C9),
            ),
          )
        ],
      ),
    );
  }
}
