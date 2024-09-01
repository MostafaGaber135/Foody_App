import 'package:flutter/material.dart';
import 'package:foody_app/models/food_market_model.dart';

class CustomListTileFoodMarket extends StatelessWidget {
  const CustomListTileFoodMarket({super.key, required this.foodMarket});

  final FoodMarket foodMarket;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        foodMarket.text,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w400,
          color: Color(
            0XFF020202,
          ),
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_sharp,
      ),
    );
  }
}
