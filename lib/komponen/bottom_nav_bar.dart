import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int) onTap;
  const MyBottomNavBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: const Color.fromARGB(255, 210, 137, 109),
      onTap: (value) => onTap(value),
      animationDuration: const Duration(milliseconds: 300),
      items: const [
        Icon(Icons.home),
        Icon(Icons.shopping_bag_rounded),
        Icon(Icons.settings),
      ],
    );
  }
}
