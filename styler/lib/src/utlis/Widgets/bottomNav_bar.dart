import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive icon size based on screen width
    double iconSize = MediaQuery.of(context).size.width * 0.08;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: _buildNavBarItems(iconSize),
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      backgroundColor: AppColors.background,
      selectedFontSize: 14, // Adjust text size for responsiveness
      unselectedFontSize: 12,
    );
  }

  List<BottomNavigationBarItem> _buildNavBarItems(double iconSize) {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home, size: iconSize), // Directly set the icon size
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.store, size: iconSize), // Directly set the icon size
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.location_on, size: iconSize), // Directly set the icon size
        label: 'Track',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart, size: iconSize), // Directly set the icon size
        label: 'Orders',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person, size: iconSize), // Directly set the icon size
        label: 'Profile',
      ),
    ];
  }
}
