import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/utlis/AppColors.dart';

// Define a provider for designer details
final designerProvider = Provider<DesignerModel>((ref) {
  return DesignerModel(
    imagePath: 'assets/images/Designer1.png',
    name: 'Alexa Montague',
    title: 'Lead Fashion Designer',
    experience: '12 Years',
    description:
        'Alexa specializes in luxury apparel \n  and has a keen eye for blending  \n traditional craftsmanship with modern \n trends. ',
  );
});

// Model class for designer data
class DesignerModel {
  final String imagePath;
  final String name;
  final String title;
  final String experience;
  final String description;

  DesignerModel({
    required this.imagePath,
    required this.name,
    required this.title,
    required this.experience,
    required this.description,
  });
}

// Reusable DesignerCard widget
class DesignerCard extends ConsumerWidget {
  const DesignerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get designer data from the provider
    final designer = ref.watch(designerProvider);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
        side: const BorderSide(
          color: AppColors.primary, // Blue border
          width: 1, // Border width
        ),
      ),
      child: Container(
        width: 178, // Card width
        height: 290, // Card height
        padding: const EdgeInsets.all(10), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                designer.imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            // Name and Title
            Text(
              designer.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              designer.title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            // Experience
            Text(
              designer.experience,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              designer.description,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black87,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // Social Media Icons Row
            Row(
              children: const [
                Icon(Icons.facebook, color: Colors.blue),
                SizedBox(width: 8),
                Icon(Icons.person, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
