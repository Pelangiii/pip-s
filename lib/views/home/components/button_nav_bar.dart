import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';

class ButtomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const ButtomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home"
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "wishlist"
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "settings"
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "profile"
          ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onItemTapped,
      );
  }
}