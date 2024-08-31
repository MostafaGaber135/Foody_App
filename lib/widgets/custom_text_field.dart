import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint; // Add this parameter
  final String? Function(String?)? validator; // Add this parameter

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: getResoponsiveFontSize(context, fontSize: 14),
          color: const Color(0XFF8D92A3),
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
      ),
      validator: validator, // Use the validator parameter
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }
}
