import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:foody_app/models/rating_order_model.dart';
import 'package:foody_app/pages/food_details_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomContainerOrder extends StatefulWidget {
  const CustomContainerOrder({super.key, required this.ratingOrderModel});
  final RatingOrderModel ratingOrderModel;

  @override
  State<CustomContainerOrder> createState() => _CustomContainerOrderState();
}

class _CustomContainerOrderState extends State<CustomContainerOrder> {
  double value = 2;

  @override
  void initState() {
    super.initState();
    _loadRating();
  }

  void _loadRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      value = prefs.getDouble('rating') ?? 2;
    });
  }

  void _saveRating(double newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('rating', newValue);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsPage(
              ratingOrderModel: widget.ratingOrderModel,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(
          16,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.01),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(widget.ratingOrderModel.image),
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: Text(
                widget.ratingOrderModel.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF020202),
                ),
              ),
            ),
            const SizedBox(height: 12),
            RatingStars(
              value: widget.ratingOrderModel.rating.toDouble(),
              onValueChanged: (v) {
                setState(() {
                  value = v;
                });
                _saveRating(v);
              },
              starBuilder: (index, color) => Icon(
                Icons.star,
                color: color,
              ),
              starCount: 5,
              starSize: 20,
              starSpacing: 2,
              maxValue: 5,
              maxValueVisibility: true,
              valueLabelVisibility: true,
              animationDuration: const Duration(milliseconds: 1000),
              valueLabelPadding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 10,
              ),
              valueLabelMargin: const EdgeInsets.only(right: 8),
              starOffColor: const Color(0xFFECECEC),
              starColor: const Color(0XFFEB0029),
            ),
          ],
        ),
      ),
    );
  }
}
