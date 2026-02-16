import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.progress});
final double progress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Text(
          "مسابقة حكايتي",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        LinearProgressIndicator(
          value: progress,
          minHeight: 8,
          backgroundColor: Colors.grey.shade300,
          valueColor:
          const AlwaysStoppedAnimation(Color(0xff7BB4CC)),
          borderRadius: BorderRadius.circular(20),
        ),
      ],
    );
  }
}
