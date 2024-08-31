import 'package:flutter/material.dart';

class CustomFullName extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const CustomFullName({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
        hintText: hint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your full name';
        }
        if (value.length <= 3) {
          return 'Full name must be more than 3 letters';
        }
        final namePattern = RegExp(r'^[a-zA-Z\s]+$');
        if (!namePattern.hasMatch(value)) {
          return 'Full name must contain only letters and spaces';
        }
        return null;
      },
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );
}
