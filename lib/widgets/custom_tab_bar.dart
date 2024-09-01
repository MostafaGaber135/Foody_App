import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final int tabLength;
  final List<String> tabLabels;
  final List<Widget> tabViews;

  const CustomTabBar({
    required this.tabLength,
    required this.tabLabels,
    required this.tabViews,
    super.key,
  });

  @override
  CustomTabBarState createState() => CustomTabBarState();
}

class CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabLength, vsync: this);
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
          tabs: widget.tabLabels.map((label) => Tab(text: label)).toList(),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}
