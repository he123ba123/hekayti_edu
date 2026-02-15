import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MicCircle extends StatelessWidget {
  const MicCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 240.w,
          height: 240.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffCFE8F3).withOpacity(.3),
          ),
        ),
        Container(
          width: 180.w,
          height: 180.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child:  Icon(
            Icons.mic,
            size: 60.dm,
            color: Color(0xff5BA9C9),
          ),
        ),
      ],
    );
  }
}
