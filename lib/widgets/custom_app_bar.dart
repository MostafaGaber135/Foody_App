import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.subTitle, this.onTap});
  final String title, subTitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: const Color(0XFFEB0029),
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: getResoponsiveFontSize(context, fontSize: 22),
                fontWeight: FontWeight.w500,
                color: const Color(0XFF020202),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: getResoponsiveFontSize(context, fontSize: 22),
                fontWeight: FontWeight.w500,
                color: const Color(0XFF8D92A3),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
