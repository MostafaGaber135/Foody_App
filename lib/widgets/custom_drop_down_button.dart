import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.validator, required this.hint, // Add the validator parameter
  });

  final String? value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String hint;
  final String? Function(String?)? validator; // Declare the validator

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
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
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator, // Use the validator here
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );
}
