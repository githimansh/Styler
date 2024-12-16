import 'package:flutter/material.dart';
import 'package:styler/src/feature/Designer_Details/about_page.dart';
import 'package:styler/src/feature/sort&filters/sort.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
// import 'filter_modal.dart'; // Import the file where your FilterModal widget is defined.

class AfterFilterScreen extends StatefulWidget {
  const AfterFilterScreen({super.key});

  @override
  _AfterFilterScreenState createState() => _AfterFilterScreenState();
}

class _AfterFilterScreenState extends State<AfterFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dresses',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.accent,
          ),
        ),
        leading: const CustomBackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.iconColor),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.appBarBackground,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPopularCard(),
            const SizedBox(height: 16),
            
            _buildPopularCard(),
            const SizedBox(height: 32), // Add the Show Filters button here
          ],
        ),
      ),
    );
  }

  // Method to build the Show Filters button
  

  Widget _buildPopularCard() {
     return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DesignerDetails()),
        );
      },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageWithFavoriteButton(),
            const SizedBox(height: 16),
            _buildLocationRow(),
            const SizedBox(height: 8),
            _buildTitleAndTag(),
            const SizedBox(height: 16),
            _buildOrderInfo(),
            const SizedBox(height: 8),
            _buildServiceDetails(),
            const SizedBox(height: 16),
            _buildSetAppointmentButton(),
            const SizedBox(height: 16),
            _buildRatingRow(),
          ],
        ),
      ),
    ),
    );
  }

  Widget _buildImageWithFavoriteButton() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/most_popular.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: IconButton(
            icon: Icon(Icons.favorite_border, color: AppColors.background, size: 30),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildLocationRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'NEW YORK, USA',
          style: TextStyle(
            color: AppColors.locationTextColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Icon(Icons.location_on, size: 16, color: AppColors.primary),
            SizedBox(width: 4),
            Text(
              '5 Km',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitleAndTag() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Aria Couture',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.userNameColor,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue),
            color: const Color(0xFFD9E0FF),
          ),
          child: const Text(
            'Designer',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        '2,341 orders completed',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildServiceDetails() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specialization: High-Fashion Evening Gowns, Custom Wedding Dresses, and Luxury Bespoke Tailoring.',
          style: TextStyle(fontSize: 12, color: AppColors.hintColor),
        ),
        SizedBox(height: 8),
        Text(
          'Services: Custom Design Consultations, Garment Creation, Alterations.',
          style: TextStyle(fontSize: 12, color: AppColors.hintColor),
        ),
        SizedBox(height: 8),
        Text(
          'Description: Aria Couture brings elegance and sophistication to every custom piece, with a focus on intricate detailing and perfect tailoring, ideal for clients seeking red-carpet glamour or unforgettable bridal gowns.',
          style: TextStyle(fontSize: 12, color: AppColors.hintColor),
        ),
      ],
    );
  }

  Widget _buildSetAppointmentButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.pink),
          ),
          backgroundColor: AppColors.background,
        ),
        child: const Text(
          'Set Appointment',
          style: TextStyle(color: Colors.pink),
        ),
      ),
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [  
        const Text(
          '(4.9/5)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        ...List.generate(
          4,
          (index) => Icon(Icons.star, color: AppColors.primary, size: 20),
        ),
        Icon(Icons.star_half, color: AppColors.primary, size: 20),
        const SizedBox(width: 8),
        const Text(
          ' (75 Reviews)',
          style: TextStyle(fontSize: 14, color: Colors.red),
        ),
      ],
    );
  }
}
