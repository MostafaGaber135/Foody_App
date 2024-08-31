import 'package:flutter/material.dart';
import 'package:foody_app/widgets/item_grid_view.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  CustomTabBarState createState() => CustomTabBarState();
}

class CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.fill,
          labelPadding: const EdgeInsets.only(right: 20),
          indicatorPadding: EdgeInsets.zero,
          controller: _tabController,
          tabs: const [
            Tab(text: 'New Taste'),
            Tab(text: 'Popular'),
            Tab(text: 'Recommended'),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: ItemGridView(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: ItemGridView(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: ItemGridView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
