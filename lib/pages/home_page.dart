import 'package:flutter/material.dart';
import 'package:foody_app/pages/profile_page.dart';
import 'package:foody_app/pages/shopping_page.dart';
import 'package:foody_app/widgets/custom_bottom_nav_bar.dart';
import 'home_page_content.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePageContent(),
    const ShoppingPage(),
    const ProfilePage(),
  ];

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        
        onTabChanged: _onTabChanged,
      ),
    );
  }
}
