import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomContainerSocialMedia extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback? onTap;

  const CustomContainerSocialMedia({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 145,
        decoration: BoxDecoration(
          color: const Color(0XFFEB0029).withOpacity(0.10),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage(image),
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style: TextStyle(
                  color: const Color(0XFF575757),
                  fontSize: getResoponsiveFontSize(context, fontSize: 14),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
