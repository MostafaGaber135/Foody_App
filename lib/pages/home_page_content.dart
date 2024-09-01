import 'package:flutter/material.dart';
import 'package:foody_app/widgets/custom_app_bar_home_page.dart';
import 'package:foody_app/widgets/item_grid_view.dart';
import 'package:foody_app/widgets/rating_order_grid_view.dart';
import 'package:foody_app/widgets/custom_tab_bar.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBarHomePage(),
          Expanded(
            flex: 2,
            child: RatingOrderGridView(),
          ),
          SizedBox(
            height: 2,
          ),
          Expanded(
            flex: 3,
            child: CustomTabBar(
              tabLabels: [
                'New Taste',
                'Popular',
                'Recommended',
              ],
              tabLength: 3,
              tabViews: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ItemGridView(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ItemGridView(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ItemGridView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
