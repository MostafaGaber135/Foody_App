import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';
import 'package:foody_app/widgets/custom_item_grid_view_shopping_page.dart';
import 'package:foody_app/widgets/custom_past_orders_gird_view.dart';
import 'package:foody_app/widgets/custom_tab_bar.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Orders',
            style: TextStyle(
              fontSize: getResoponsiveFontSize(context, fontSize: 22),
              fontWeight: FontWeight.w500,
              color: const Color(0XFF020202),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Wait for the best meal',
            style: TextStyle(
              fontSize: getResoponsiveFontSize(context, fontSize: 22),
              fontWeight: FontWeight.w500,
              color: const Color(0XFF8D92A3),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: CustomTabBar(
              tabLabels: [
                'In Progress',
                'Past Orders',
              ],
              tabLength: 2,
              tabViews: [
                CustomItemGridViewShoppingPage(),
                CustomPastOrdersGridView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
