import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomButton extends StatelessWidget {
 final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
     required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.onPressed, 
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
              side: BorderSide(color: borderColor),
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
