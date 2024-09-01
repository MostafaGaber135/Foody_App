import 'package:flutter/material.dart';
import 'package:foody_app/models/past_orders_model.dart';
import 'package:foody_app/widgets/custom_list_tile_past_orders.dart';

class CustomPastOrdersGridView extends StatelessWidget {
  const CustomPastOrdersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsPastOrders = [
      PastOrders(
        image: 'assets/images/Kari Sleman.png',
        title: 'Kari Sleman',
        subTitle: '1 item • IDR 289.000',
        date: 'Jun 12, 14:00',
      ),
      PastOrders(
        image: 'assets/images/Avosalado.png',
        title: 'Avosalado',
        subTitle: '1 item • IDR 6.000.000',
        date: 'Mei 2, 09:00',
        status: 'Cancelled',
      ),
    ];
    return GridView.builder(
      itemCount: itemsPastOrders.length,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 4.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return  Padding(
          padding:  const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child:  CustomListTilePastOrders(
            itemsPastOrders: itemsPastOrders[index],
          ),
        );
      },
    );
  }
}
