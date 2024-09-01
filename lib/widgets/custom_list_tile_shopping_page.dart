import 'package:flutter/material.dart';
import 'package:foody_app/models/item_shopping_model.dart';

class CustomListTileShoppingPage extends StatelessWidget {
  const CustomListTileShoppingPage({super.key, required this.itemsShopping,});
  final ItemShopping itemsShopping;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Image(
        fit: BoxFit.cover,
        image: AssetImage(itemsShopping.image),
      ),
      title: Text(
        itemsShopping.title,
        style: const TextStyle(fontSize: 13.5),
      ),
      subtitle: Text(itemsShopping.subTitle),
    );
  }
}
