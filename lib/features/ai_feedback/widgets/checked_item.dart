import 'package:flutter/material.dart';
class CheckedItem extends StatelessWidget {
  final String text;
  const CheckedItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(color: Color(0xff6BB3CE)),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }
}