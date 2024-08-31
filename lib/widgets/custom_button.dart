import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;
  final Color? borderColor; // Optional border color

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.backgroundColor,
    this.borderColor, // Optional parameter
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.9,
        height: 56,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: borderColor != null
                  ? BorderSide(color: borderColor!)
                  : BorderSide.none,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: getResoponsiveFontSize(context, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
