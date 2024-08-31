import 'package:flutter/material.dart';
import 'package:foody_app/models/item_model.dart';
import 'package:foody_app/widgets/custom_item.dart';

class ItemGridView extends StatelessWidget {
  const ItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ItemModel(
        image: 'assets/images/pic_soup.png',
        title: 'Soup Bumil',
        subTitle: 'IDR 289.000',
        rating: 4.1,
      ),
      ItemModel(
        image: 'assets/images/pic_chiken.png',
        title: 'Chicken',
        subTitle: 'IDR 4.509.000',
        rating: 4.7,
      ),
      ItemModel(
        image: 'assets/images/pic_shrimp.png',
        title: 'Shrimp',
        subTitle: 'IDR 999.000',
        rating: 3.2,
      ),
      ItemModel(
        image: 'assets/images/pic_burger.png',
        title: 'Burger',
        subTitle: 'IDR 459.000',
        rating: 3.2,
      ),
    ];
    return GridView.builder(
      itemCount: items.length,
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
          child: CustomItem(
            items: items[index],
          ),
        );
      },
    );
  }
}
