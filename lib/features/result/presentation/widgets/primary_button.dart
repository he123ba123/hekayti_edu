import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff7CC0DA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        icon: const Icon(Icons.menu_book,color: Colors.white),
        label: const Text(
          "موضوع جديد",
          style:
          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }
}
