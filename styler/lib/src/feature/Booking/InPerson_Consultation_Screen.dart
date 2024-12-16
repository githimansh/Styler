import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/Widgets/custom_text_buttom.dart';

class InPersonConsultationFinalScreen extends ConsumerWidget {
  const InPersonConsultationFinalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'In-Person Consultation',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Duration:', 'Typically 45-60 Minutes'),
            _buildSectionTitle('Benefits:'),
            _buildBulletedList([
              'Face-to-face interaction for more personal and direct communication.',
              'Hands-on assistance and immediate feedback.',
              'Access to in-person tools, equipment, or physical products (if applicable).',
            ]),
            _buildSectionTitle('Ideal For:'),
            _buildBulletedList([
              'Those who prefer personal interaction and a more detailed, hands-on consultation.',
              'Clients looking for a more immersive experience or needing physical presence.',
            ]),
            _buildSectionTitle('Date & Time'),
            const Text("Date: October 10, 2024"),
            const Text("Time: 2:00 PM"),
            _buildSectionTitle('Duration'),
            const Text("Duration: 45 minutes"),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Price:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  "\$200",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            _buildSectionTitle('Location'),
            const Text("Address: 123 Business Lane, Suite 456, Cityville, ST, 12345"),
            const Text("Landmark: Near City Center Mall"),
            const SizedBox(height: 8),
            const Text(
              "Instructions: Please arrive 10 minutes early to complete any necessary paperwork and check-in at the reception.",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "Your meeting is confirmed!!",
                style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "MEET YOUR DESIGNER",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/images/designer_image.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "You are meeting with khushi Singh",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Khushi Singh",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Try these services",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ServiceItem(imagePath: 'assets/images/service1.png', label: 'Custom Design Services'),
                ServiceItem(imagePath: 'assets/images/service2.png', label: 'Ready-to-Wear'),
                ServiceItem(imagePath: 'assets/images/service3.png', label: 'Custom Design Services'),
              ],
            ),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextButton(
                  text: "Cancel",
                  width: 160,
                  height: 50,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CustomTextButton(
                  text: "Book Now",
                  width: 160,
                  height: 50,
                  onPressed: () {
                    // Navigate or perform booking action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String info) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          info,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildBulletedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const ServiceItem({
    required this.imagePath,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 40,
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
