import 'package:flutter/material.dart';

class CustomFullName extends StatelessWidget {
  final TextEditingController controller;

  const CustomFullName({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter your full name',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your full name';
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
