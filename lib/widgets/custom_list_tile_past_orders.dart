import 'package:flutter/material.dart';
import 'package:foody_app/models/past_orders_model.dart';

class CustomListTilePastOrders extends StatelessWidget {
  const CustomListTilePastOrders({super.key, required this.itemsPastOrders});
  final PastOrders itemsPastOrders;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Image(
        fit: BoxFit.cover,
        image: AssetImage(itemsPastOrders.image),
      ),
      title: Text(
        itemsPastOrders.title,
        style: const TextStyle(fontSize: 13.5),
      ),
      subtitle: Text(itemsPastOrders.subTitle),
      trailing: Column(
        children: [
          Text(itemsPastOrders.date!),
          const Spacer(),
          Text(
            itemsPastOrders.status!,
            style: const TextStyle(
              color: Color(0XFFFA7070),
            ),
          ),
        ],
      ),
    );
  }
}
