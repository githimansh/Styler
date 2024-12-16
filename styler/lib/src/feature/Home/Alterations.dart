import 'package:flutter/material.dart';
import 'package:styler/src/feature/Home/recommended.dart';

class AlterationsSection extends StatelessWidget {
  const AlterationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendedItems = [
      {
        "imageUrl": "https://via.placeholder.com/100",
        "name": "Perfect Fit Alterations",
        "price": "\$40",
        "duration": "40 mins",
      },
      {
        "imageUrl": "https://via.placeholder.com/100",
        "name": "Perfect Fit Alterations",
        "price": "\$40",
        "duration": "40 mins",
      },
      {
        "imageUrl": "https://via.placeholder.com/100",
        "name": "Perfect Fit Alterations",
        "price": "\$40",
        "duration": "40 mins",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Alterations",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recommendedItems.length,
            itemBuilder: (context, index) {
              final item = recommendedItems[index];
              return RecommendedWidget(
                imageUrl: item["imageUrl"]!,
                name: item["name"]!,
                price: item["price"]!,
                duration: item["duration"]!,
              );
            },
          ),
        ],
      ),
    );
  }
}
