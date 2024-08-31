import 'package:flutter/material.dart';

class CustomAppBarHomePage extends StatelessWidget {
  const CustomAppBarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FoodMarket',
                style: TextStyle(
                  color: const Color(0XFF020202),
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.08, 
                ),
              ),
              Text(
                'Let’s get some foods',
                style: TextStyle(
                  color: const Color(0XFF8D92A3),
                  fontWeight: FontWeight.w300,
                  fontSize: width * 0.05, 
                ),
              ),
            ],
          ),
          const Image(
            image: AssetImage('assets/images/image 2.png'),
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
