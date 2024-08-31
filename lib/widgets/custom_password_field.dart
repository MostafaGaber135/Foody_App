import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator; // Add this parameter

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.hint,
    this.validator, // Add this line
  });

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
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
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: const Color(0XFF8D92A3),
          ),
          onPressed: _toggleObscureText,
        ),
      ),
      obscureText: _obscureText,
      validator: widget.validator, // Use the validator here
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }
}
