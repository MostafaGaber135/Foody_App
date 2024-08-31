import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabChanged; // Callback function

  const CustomBottomNavBar({super.key, required this.onTabChanged});

  @override
  CustomBottomNavBarState createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _selectedIndex == 0 ? Colors.red : Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: _selectedIndex == 1 ? Colors.red : Colors.grey,
              ),
              if (_selectedIndex == 1)
                const Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ),
                ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            color: _selectedIndex == 2 ? Colors.red : Colors.grey,
          ),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
