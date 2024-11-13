import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/common/provider/provider.dart';
import 'package:styler/src/feature/Home/appointment.dart';
import 'package:styler/src/feature/Home/most_popular.dart';
import 'package:styler/src/feature/Home/special_offers.dart';
import 'package:styler/src/utlis/Widgets/categories.dart';
import 'package:styler/src/utlis/Widgets/custom_app_bar.dart';
import 'package:styler/src/utlis/AppColors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: CustomAppBar(user: user),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSpecialOfferSection(context),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Categories(),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: AppointmentReminderCard(),
            ),
            _buildMostPopularSection(context),
            const Padding(padding: EdgeInsets.all(8)),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialOfferSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Special Offers",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColor,
                    letterSpacing: -0.3,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpecialOfferPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            width: 410,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/specialOffer/offer1.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMostPopularSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MostPopularScreen(),
                ),
              );
            },
            child: const Text(
              'Most Popular',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset('assets/images/image8.png'),
        ],
      ),
    );
  }
}
