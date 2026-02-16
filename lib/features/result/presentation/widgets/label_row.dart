import 'package:flutter/cupertino.dart';

class LabelRow extends StatelessWidget {
  const LabelRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "دقة الإجابات",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          "ممتاز",
          style: TextStyle(
            color: Color(0xff7CC0DA),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
