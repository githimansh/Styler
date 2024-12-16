import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/common/provider/provider.dart';
import 'package:styler/src/feature/Home/Alterations.dart';
import 'package:styler/src/feature/Home/Packages.dart';
import 'package:styler/src/feature/Home/Popular.dart';
import 'package:styler/src/feature/Home/appointment.dart';
import 'package:styler/src/feature/Home/most_popular.dart';
import 'package:styler/src/feature/Home/recommende_screen.dart';
import 'package:styler/src/feature/Home/special_offers.dart';
import 'package:styler/src/utlis/Widgets/bottomNav_bar.dart';
import 'package:styler/src/utlis/Widgets/categories.dart';
import 'package:styler/src/utlis/Widgets/custom_app_bar.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/custom_text_buttom.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: CustomAppBar(user: user),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSpecialOfferSection(context),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Categories(),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: AppointmentReminderCard(),
            ),
            _buildMostPopularSection(context),
            const SizedBox(height: 16),
            _buildHorizontalButtonList(),
            const Padding(
              padding: EdgeInsets.all(8),
              child: RecommendedSection(),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: PackagesSection(),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: PopularSection(),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: AlterationsSection(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSpecialOfferSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                      color: AppColors.primary,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => _buildImageCard(
                      'assets/images/specialOffer/offer${index + 1}.png'),
                ),
              ),
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
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => _buildImageCard('assets/images/image8.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalButtonList() {
    final buttonLabels = ["Recommended", "Packages", "Fabrics", "Popular", "Offer"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 50,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: buttonLabels
                .map((label) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CustomTextButton(text: label, onPressed: () {}),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(String imagePath, {BoxFit boxfit = BoxFit.cover}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 450,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          imagePath,
          fit: boxfit,
        ),
      ),
    );
  }
}
