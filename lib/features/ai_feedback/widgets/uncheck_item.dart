import 'package:flutter/material.dart';

class UncheckItem extends StatelessWidget {
  const UncheckItem({super.key, required this.text});
  final String text;
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
          const Icon(Icons.radio_button_unchecked, color: Colors.grey),
        ],
      ),
    );
  }
}
