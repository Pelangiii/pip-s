import 'package:flutter/material.dart';

class CatalogueAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CatalogueAppBar({super.key});

  @override
  State<CatalogueAppBar> createState() => _CatalogueAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CatalogueAppBarState extends State<CatalogueAppBar> {
  final List<String> messages = [
    "🔥 Big Sale Today!",
    "🎮 New Games Released",
    "⚡ Top Up Faster Here",
  ];

  int _index = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), _changeMessage);
  }

  void _changeMessage() {
    setState(() {
      _index = (_index + 1) % messages.length;
    });
    Future.delayed(const Duration(seconds: 2), _changeMessage);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      elevation: 0,
      titleSpacing: 0,
      title: Row(
        children: [
          // Logo kiri
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Image.asset(
              "assets/images/drinkware/PiplogoWhite.png",
              height: 35,
            ),
          ),

          // Animasi teks di tengah → Flexible biar gak overflow
          Expanded(
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: child,
                ),
                child: Text(
                  messages[_index],
                  key: ValueKey<String>(messages[_index]),
                  overflow: TextOverflow.ellipsis, // biar gak overflow
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none, color: Colors.white),
        ),
      ],
    );
  }
}
