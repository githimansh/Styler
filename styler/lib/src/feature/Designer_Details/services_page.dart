import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of services and their respective types
    final List<Map<String, String>> services = [
      {"title": "Luxury Custom Apparel", "types": "04 Types"},
      {"title": "Ready-To-Wear Collection", "types": "02 Types"},
      {"title": "Personal Styling & Wardrobe Consultation", "types": "02 Types"},
      {"title": "Accessories Design", "types": "02 Types"},
      {"title": "Tailoring & Alterations", "types": "02 Types"},
      {"title": "Special Occasion Design", "types": "02 Types"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Services"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title text
            const Text(
              "Our Services",
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // ListView for service tiles
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ServiceTile(
                      title: service["title"]!,
                      types: service["types"]!,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Custom Button for booking
            CustomButton(buttonText: "Book Now"),
          ],
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final String types;

  const ServiceTile({
    super.key,
    required this.title,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          types,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Detailed information about $title can be added here.",
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
