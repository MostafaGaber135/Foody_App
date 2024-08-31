import 'package:flutter/material.dart';
import 'package:foody_app/models/rating_order_model.dart';
import 'package:foody_app/widgets/custom_container_order.dart';

class RatingOrderGridView extends StatelessWidget {
  const RatingOrderGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final ratingOrder = [
      RatingOrderModel(
        image: 'assets/images/pic.png',
        name: 'Cherry Healthy',
        description:
            'Makanan khas Bandung yang cukup sering dipewas oleh anak muda dengan pola makan yang cukup tinggal dengan menggunakan makanan diet yang sehat dan teratur.',
        rating: 5,
        ingredients: 'Seledri, telur, blueberry, madu',
        price: 12289000,
      ),
      RatingOrderModel(
        image: 'assets/images/pic (1).png',
        name: 'Burger Tamayo',
        description:
            'Burger Tamayo is a gourmet burger that blends rich, juicy flavors with a unique twist. This burger features a succulent beef patty seasoned with a special blend of spices, topped with creamy cheddar cheese, crispy bacon, and a tangy tamayo (tomato-based) sauce.',
        rating: 2,
        price: 31202012,
        ingredients:
            'Ground beef, Salt and black pepper, Garlic powder, Onion powder',
      ),
      RatingOrderModel(
        image: 'assets/images/pasta.png',
        name: 'Pasta',
        rating: 1,
        description:
            'Pasta Alfredo is a classic Italian dish known for its creamy, rich sauce and tender pasta. This indulgent meal features fettuccine noodles smothered in a velvety Alfredo sauce made from butter, heavy cream, and Parmesan cheese.',
        price: 12399527,
        ingredients:
            'Fettuccine, Butter, Heavy cream, Parmesan cheese, Garlic, Parsley, Salt, Black pepper, Garlic bread',
      ),
      RatingOrderModel(
        image: 'assets/images/Cooked Seafoods.jpg',
        name: 'Cooked Seafoods',
        rating: 4,
        price: 32123420,
        description:
            'A delectable assortment of seafood, including shrimp, crab, mussels, and clams, cooked to perfection. The seafood is sautéed with garlic and butter, then seasoned with fresh lemon juice, parsley, salt, and black pepper for a flavorful and savory experience.',
        ingredients:
            'Shrimp, Crab, Mussels, Clams, Garlic, Lemon juice, Butter, Parsley, Salt, Black pepper',
      ),
    ];
    return GridView.builder(
      itemCount: ratingOrder.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: CustomContainerOrder(
            ratingOrderModel: ratingOrder[index],
          ),
        );
      },
    );
  }
}
