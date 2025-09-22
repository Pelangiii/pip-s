import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';


class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemsTapped;

  const BottomNavbar({super.key, required this.selectedIndex, required this.onItemsTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Wishlist"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Setting"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile"
        )
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onItemsTapped,
    );
  }
}