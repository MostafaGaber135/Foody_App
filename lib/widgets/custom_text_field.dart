import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Type your email address',
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
      validator: (value) {
        const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
        final regExp = RegExp(emailPattern);

        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email';
        }

     
  
        return null;
      },
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }
}
