import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xff6BB3CE)),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu_book, color: Color(0xff6BB3CE)),
              SizedBox(width: 10),
              Text(
                "اقرأ القصة مرة أخرى",
                style: TextStyle(
                  color: Color(0xff6BB3CE),
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
