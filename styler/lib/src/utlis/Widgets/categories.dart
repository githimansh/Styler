import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align the title to the left
      children: [
        // "Our Categories" title
        const Padding(
          padding: EdgeInsets.only(left: 0.0), // Left padding for alignment
          child: Text(
            'Our Categories',
            style: TextStyle(
              fontSize: 20, // Increase font size for emphasis
              fontWeight: FontWeight.bold, // Make the text bold
              color: AppColors.textColor, // Matching color to the theme
            ),
          ),
        ),
        SizedBox(height: 16), // Space between title and categories

        // Categories grid
        Wrap(
          spacing: 19.0, // Adjust spacing as needed
          runSpacing: 16.0,
          children: [
            _buildCategoryItem(Icons.face, 'Formals'),
            _buildCategoryItem(Icons.wc, 'Casual'),
            _buildCategoryItem(Icons.category, 'Traditional'),
            _buildCategoryItem(Icons.person, 'Suits'),
            _buildCategoryItem(Icons.child_friendly, 'Childrens'),
            _buildCategoryItem(Icons.brush, 'Sportswear'),
            _buildCategoryItem(Icons.brush, 'Party'),
            _buildCategoryItem(Icons.brush, 'Bridal'),
            _buildCategoryItem(Icons.star, 'Tops/Blouses'),
            _buildCategoryItem(Icons.star, 'Others'),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor:  AppColors.iconBackground,
          child: Icon(icon, color: AppColors.primary, size: 26),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,

          ),
        ),
      ],
    );
  }
}
