import 'package:flutter/material.dart';
import 'package:safe/core/constants/app_colors.dart';

class Dots extends StatelessWidget {
  final int currentIndex;
  const Dots({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 3; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: i < currentIndex ? const Color(0xFF0198CF) : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
      ],
    );
  }
}
