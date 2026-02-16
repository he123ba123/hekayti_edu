import 'package:flutter/cupertino.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  const SectionTitle({super.key, required this.text, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 10),
        Icon(icon, color: color),
      ],
    );
  }
}