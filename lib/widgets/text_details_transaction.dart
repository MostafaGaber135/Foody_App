import 'package:flutter/material.dart';

class TextDetailsTransaction extends StatelessWidget {
  const TextDetailsTransaction({
    super.key,
    required this.text,
    required this.subText,
    this.color,
  });
  final String text;
  final String subText;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color(
              0XFF8D92A3,
            ),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Text(
          subText,
          style: TextStyle(
            color: color ?? const Color(0XFF020202),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
