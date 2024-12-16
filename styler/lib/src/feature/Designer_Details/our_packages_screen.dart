import 'package:flutter/material.dart';
import 'package:styler/src/feature/Designer_Details/services_page.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of package details
    final List<Map<String, String>> packages = [
      {
        'title': 'Signature Couture Package',
        'description':
            '• Personalized consultation for a custom evening gown or cocktail dress.\n'
            '• Access to exclusive luxury fabrics like silk, satin, and velvet.\n'
            '• Hand-embellishments such as beadwork and lace appliqué.\n'
            '• 3 fitting sessions for a perfect fit.\n'
            '• Complimentary delivery in luxury packaging.',
        'imageUrl': 'https://via.placeholder.com/100',
        'footer': 'Clients attending red carpet events, galas, or formal dinners.',
      },
      {
        'title': 'Signature Couture Package',
        'description':
            '• Personalized consultation for a custom evening gown or cocktail dress.\n'
            '• Access to exclusive luxury fabrics like silk, satin, and velvet.\n'
            '• Hand-embellishments such as beadwork and lace appliqué.\n'
            '• 3 fitting sessions for a perfect fit.\n'
            '• Complimentary delivery in luxury packaging.',
        'imageUrl': 'https://via.placeholder.com/100',
        'footer': 'Clients attending red carpet events, galas, or formal dinners.',
      },
      {
        'title': 'Signature Couture Package',
        'description':
            '• Personalized consultation for a custom evening gown or cocktail dress.\n'
            '• Access to exclusive luxury fabrics like silk, satin, and velvet.\n'
            '• Hand-embellishments such as beadwork and lace appliqué.\n'
            '• 3 fitting sessions for a perfect fit.\n'
            '• Complimentary delivery in luxury packaging.',
        'imageUrl': 'https://via.placeholder.com/100',
        'footer': 'Clients attending red carpet events, galas, or formal dinners.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Packages'),
      ),
      body: SingleChildScrollView(
        // Wrap the body in a SingleChildScrollView
        child: Column(
          children: [
            // ListView.builder is now placed inside a Column
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: packages.map((package) {
                  return PackageCard(
                    title: package['title']!,
                    description: package['description']!,
                    imageUrl: package['imageUrl']!,
                    footer: package['footer']!,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            TryServices(), // Corrected TryServices widget call
            const SizedBox(height: 8), // Space before the button
            // Custom Button at the bottom
            CustomButton(
              buttonText: "Book Now",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServicesPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// A reusable package card widget
class PackageCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String footer;

  const PackageCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: AppColors.primary, // Blue border
          width: 1,
        ),
      ),
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF546879),
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        footer,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF025195),
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TryServices widget fixed
// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

class TryServices extends StatelessWidget {
  const TryServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0), // Padding around the container set to 0 as per CSS
      width: 370, // Width as per CSS
      height: 165, // Height as per CSS
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          // Header Text - "Try these services"
          const Text(
            "Try these services",
            style: TextStyle(
              color: Color(0xFF1C1C28), // Dark / Dark 0 color
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter', // Use 'Inter' font family
              height: 1.375, // Line height: 141% of font size
            ),
          ),
          const SizedBox(height: 16), // Gap between title and row of images (16px)

          // Row of images (Circular services)
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align images to the left
            children: [
              // First CircleAvatar
              CircleAvatar(
                radius: 44, // Adjusted radius to match width and height from CSS
                backgroundImage: AssetImage("assets/your_image_1.png"),
              ),
              const SizedBox(width: 24), // Gap between images (24px)
              // Second CircleAvatar
              CircleAvatar(
                radius: 44, // Adjusted radius
                backgroundImage: AssetImage("assets/your_image_2.png"), // Replace with the correct asset path
              ),
              const SizedBox(width: 24), // Gap between images (24px)
              // Third CircleAvatar
              CircleAvatar(
                radius: 44, // Adjusted radius
                backgroundImage: AssetImage("assets/your_image_3.png"), // Replace with the correct asset path
              ),
            ],
          ),

          const SizedBox(height: 8), // Small gap between images and text

          // Row of Text below the images
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align text to the left
            children: const [
              Text(
                "Custom Design\n   Services",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  height: 1.2, // Adjust the height for better line spacing
                ),
              ),
              SizedBox(width: 45), // Gap between the texts
              Text(
                "Ready-to-Wear\n Customization",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  height: 1.2, // Adjust the height for better line spacing
                ),
              ),
              SizedBox(width: 40), // Gap between the texts
              Text(
                "Custom Design\n Customization",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  height: 1.2, // Adjust the height for better line spacing
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
