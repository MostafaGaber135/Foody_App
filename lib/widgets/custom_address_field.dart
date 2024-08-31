import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomAddressField extends StatefulWidget {
  const CustomAddressField({
    super.key,
    required this.controller,
    this.validator, required this.hint,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hint;
  @override
  State<CustomAddressField> createState() => _CustomAddressFieldState();
}

class _CustomAddressFieldState extends State<CustomAddressField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: getResoponsiveFontSize(context, fontSize: 14),
          color: const Color(0XFF8D92A3),
        ),
        hintText: widget.hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
      ),
      validator: widget.validator,
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );
}
