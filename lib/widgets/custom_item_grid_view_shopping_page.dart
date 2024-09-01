import 'package:flutter/material.dart';
import 'package:foody_app/models/item_shopping_model.dart';
import 'package:foody_app/widgets/custom_list_tile_shopping_page.dart';

class CustomItemGridViewShoppingPage extends StatelessWidget {
  const CustomItemGridViewShoppingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      ItemShopping(
        image: 'assets/images/Avosalado.png',
        title: 'Avosalado',
        subTitle: '3 items • IDR 18.000.000',
      ),
      ItemShopping(
        image: 'assets/images/Kopi Kudda.png',
        title: 'Kopi Kudda',
        subTitle: '10 items • IDR 450.000',
      ),
      ItemShopping(
        image: 'assets/images/Es Tong-Tong.png',
        title: 'Es Tong-Tong',
        subTitle: '2 items • IDR 900.500',
      ),
      ItemShopping(
        image: 'assets/images/Bwang Puttie.png',
        title: 'Bwang Puttie',
        subTitle: '10 items • IDR 450.000',
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
          child: CustomListTileShoppingPage(
            itemsShopping: items[index],
          ),
        );
      },
    );
  }
}
