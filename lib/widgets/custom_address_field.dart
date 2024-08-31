import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomAddressField extends StatefulWidget {
  const CustomAddressField({super.key});

  @override
  State<CustomAddressField> createState() => _CustomAddressFieldState();
}

class _CustomAddressFieldState extends State<CustomAddressField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: getResoponsiveFontSize(context, fontSize: 14),
          color: const Color(0XFF8D92A3),
        ),
        hintText: 'Type your address',
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );
}
