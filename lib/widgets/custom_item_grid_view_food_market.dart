import 'package:flutter/material.dart';
import 'package:foody_app/models/food_market_model.dart';
import 'package:foody_app/widgets/custom_list_tile_food_market.dart';

class CustomItemGridViewFoodMarket extends StatelessWidget {
  const CustomItemGridViewFoodMarket({super.key});

  @override
  Widget build(BuildContext context) {
    final textFoodMarket = [
      FoodMarket(
        text: 'Rate App',
      ),
      FoodMarket(
        text: 'Help Center',
      ),
      FoodMarket(
        text: 'Privacy & Policy',
      ),
      FoodMarket(
        text: 'Terms & Conditions',
      ),
    ];
    return GridView.builder(
      itemCount: textFoodMarket.length,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 4.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child: CustomListTileFoodMarket(
            foodMarket: textFoodMarket[index],
          ),
        );
      },
    );
  }
}
