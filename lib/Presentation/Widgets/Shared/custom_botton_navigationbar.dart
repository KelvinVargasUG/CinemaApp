import 'package:flutter/material.dart';

class CustomBottonNavigationBar extends StatelessWidget {
  const CustomBottonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation: 0, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.label_outline), label: 'Label'),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outlined), label: 'Favorites'),
    ]);
  }
}
