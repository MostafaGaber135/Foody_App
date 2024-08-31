import 'package:flutter/material.dart';
import 'package:foody_app/models/rating_order_model.dart';
import 'package:foody_app/widgets/custom_food_item_card.dart';

class FoodDetailsPage extends StatelessWidget {
  final RatingOrderModel ratingOrderModel;

  const FoodDetailsPage({super.key, required this.ratingOrderModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ratingOrderModel.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 50,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFEB0029),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomFoodItemCard(
              ratingOrderModel: ratingOrderModel,
            ),
          ),
        ],
      ),
    );
  }
}
