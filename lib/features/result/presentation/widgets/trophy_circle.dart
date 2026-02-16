import 'package:flutter/material.dart';

class TrophyCircle extends StatelessWidget {
  const TrophyCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.15),
            blurRadius: 40,
            spreadRadius: 5,
          ),
        ],
      ),
      child: const Icon(
        Icons.emoji_events,
        size: 80,
        color: Color(0xff7CC0DA),
      ),
    );
  }
}
