import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomPhoneNumberField extends StatelessWidget {
  const CustomPhoneNumberField({
    super.key,
    required this.hint,
    required this.controller,
    this.validator, // Add the validator parameter
  });

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Declare the validator

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: getResoponsiveFontSize(context, fontSize: 14),
          color: const Color(0XFF8D92A3),
        ),
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
      ),
      keyboardType: TextInputType.phone,
      validator: validator, // Use the validator here
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );
}
