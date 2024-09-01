import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:foody_app/models/item_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CustomItem extends StatefulWidget {
  const CustomItem({
    super.key,
    required this.items,
  });
  final ItemModel items;

  @override
  State<CustomItem> createState() => _CustomItemState();
}

class _CustomItemState extends State<CustomItem> {
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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Image(
        width: MediaQuery.of(context).size.width * 0.15,
        fit: BoxFit.cover,
        image: AssetImage(widget.items.image),
      ),
      title: Text(
        widget.items.title,
        style: const TextStyle(fontSize: 13.5),
      ),
      subtitle: Text(widget.items.subTitle),
      trailing: RatingStars(
        value: widget.items.rating,
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
        maxValue: 5,
        starSpacing: 2,
        maxValueVisibility: true,
        valueLabelVisibility: true,
        animationDuration: const Duration(
          milliseconds: 1000,
        ),
        valueLabelPadding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 8,
        ),
        valueLabelMargin: const EdgeInsets.only(right: 8),
        starOffColor: const Color(0xFFECECEC),
        starColor: const Color(0XFFEB0029),
      ),
    );
  }
}
