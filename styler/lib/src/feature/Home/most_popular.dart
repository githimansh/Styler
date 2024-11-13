import 'package:flutter/material.dart';
import 'package:styler/src/feature/sort&filters/sort.dart';
// import 'package:styler/src/utils/AppColors.dart';
// import 'package:styler/src/utils/Widgets/back_button.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';

class MostPopularScreen extends StatefulWidget {
  const MostPopularScreen({super.key});

  @override
  _MostPopularScreenState createState() => _MostPopularScreenState();
}

class _MostPopularScreenState extends State<MostPopularScreen> {
  late Future<List<PopularItem>> popularItemsFuture;

  @override
  void initState() {
    super.initState();
    popularItemsFuture = fetchPopularItems(); // Replace with actual API call
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Most Popular',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.accent),
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
      body: FutureBuilder<List<PopularItem>>(
        future: popularItemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No popular items available.'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...snapshot.data!.map((item) => _buildPopularCard(item)).toList(),
                const SizedBox(height: 32),
                _buildShowFiltersButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildShowFiltersButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
            ),
            builder: (context) => const FilterModal(),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          backgroundColor: AppColors.primary,
        ),
        child: const Text('Show Filters'),
      ),
    );
  }

  Widget _buildPopularCard(PopularItem item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageWithFavoriteButton(item.imageUrl),
            const SizedBox(height: 16),
            _buildLocationRow(item.location, item.distance),
            const SizedBox(height: 8),
            _buildTitleAndTag(item.title, item.tag),
            const SizedBox(height: 16),
            _buildOrderInfo(item.ordersCompleted),
            const SizedBox(height: 8),
            _buildServiceDetails(item),
            const SizedBox(height: 16),
            _buildSetAppointmentButton(),
            const SizedBox(height: 16),
            _buildRatingRow(item.rating, item.reviewsCount),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithFavoriteButton(String imageUrl) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
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

  Widget _buildLocationRow(String location, double distance) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          location,
          style: const TextStyle(
            color: AppColors.locationTextColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16, color: AppColors.primary),
            const SizedBox(width: 4),
            Text(
              '${distance.toStringAsFixed(1)} Km',
              style: const TextStyle(
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

  Widget _buildTitleAndTag(String title, String tag) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
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
          child: Text(
            tag,
            style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderInfo(int ordersCompleted) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$ordersCompleted orders completed',
        style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildServiceDetails(PopularItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specialization: ${item.specialization}',
          style: const TextStyle(fontSize: 12, color: AppColors.hintColor),
        ),
        const SizedBox(height: 8),
        Text(
          'Services: ${item.services}',
          style: const TextStyle(fontSize: 12, color: AppColors.hintColor),
        ),
        const SizedBox(height: 8),
        Text(
          'Description: ${item.description}',
          style: const TextStyle(fontSize: 12, color: AppColors.hintColor),
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

  Widget _buildRatingRow(double rating, int reviewsCount) {
    return Row(
      children: [
        Text(
          '(${rating.toStringAsFixed(1)}/5)',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        ...List.generate(
          rating.floor(),
          (index) => Icon(Icons.star, color: AppColors.primary, size: 20),
        ),
        if (rating - rating.floor() >= 0.5)
          Icon(Icons.star_half, color: AppColors.primary, size: 20),
        const SizedBox(width: 8),
        Text(
          ' ($reviewsCount Reviews)',
          style: const TextStyle(fontSize: 14, color: Colors.red),
        ),
      ],
    );
  }
}

// Dummy API fetching function
Future<List<PopularItem>> fetchPopularItems() async {
  // Implement API fetching logic here
  return [];
}

// Dummy data model class
class PopularItem {
  final String imageUrl;
  final String location;
  final double distance;
  final String title;
  final String tag;
  final int ordersCompleted;
  final String specialization;
  final String services;
  final String description;
  final double rating;
  final int reviewsCount;

  PopularItem({
    required this.imageUrl,
    required this.location,
    required this.distance,
    required this.title,
    required this.tag,
    required this.ordersCompleted,
    required this.specialization,
    required this.services,
    required this.description,
    required this.rating,
    required this.reviewsCount,
  });
}
