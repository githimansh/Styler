import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align the title to the left
      children: [
        // "Our Categories" title
        Padding(
          padding: const EdgeInsets.only(left: 0.0), // Left padding for alignment
          child: Text(
            'Our Categories',
            style: TextStyle(
              fontSize: 20, // Increase font size for emphasis
              fontWeight: FontWeight.bold, // Make the text bold
              color: Colors.black, // Matching color to the theme
            ),
          ),
        ),
        SizedBox(height: 16), // Space between title and categories

        // Categories grid
        Wrap(
          spacing: 18.0, // Adjust spacing as needed
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
          backgroundColor: Colors.brown[100],
          child: Icon(icon, color: Colors.brown[600], size: 26),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.brown[800],
            fontWeight: FontWeight.w500,
            fontSize: 12,

          ),
        ),
      ],
    );
  }
}
