import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemsTapped;

  const BottomNavbar({super.key, required this.selectedIndex, required this.onItemsTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Latar gelap seperti di foto
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bagian kategori di atas (opsional, bisa dihapus kalau nggak perlu)
          // Container(
          //   height: 60,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Image.asset('assets/nintendo.png', height: 40), // Ganti dengan asset
          //       Image.asset('assets/playstation.png', height: 40), // Ganti dengan asset
          //       Image.asset('assets/xbox.png', height: 40), // Ganti dengan asset
          //       Image.asset('assets/other1.png', height: 40), // Ganti dengan asset
          //       Image.asset('assets/other2.png', height: 40), // Ganti dengan asset
          //     ],
          //   ),
          // ),
          // BottomNavigationBar utama
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: selectedIndex == 0 ? primaryColor : Colors.grey),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category, color: selectedIndex == 1 ? primaryColor : Colors.grey),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 30),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: selectedIndex == 3 ? primaryColor : Colors.grey),
                label: "My Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: selectedIndex == 4 ? primaryColor : Colors.grey),
                label: "Profile",
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: onItemsTapped,
            type: BottomNavigationBarType.fixed, // Pastikan layout tetap
            backgroundColor: Colors.black, // Latar gelap
            elevation: 0, // Hilangin shadow kalau nggak perlu
          ),
        ],
      ),
    );
  }
}