import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styler/src/feature/Booking/booking_page.dart';
// import 'package:styler/src/feature/Booking/booking_page';
import 'package:styler/src/feature/Designer_Details/about_us.dart';
import 'package:styler/src/feature/Designer_Details/designer_card.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/custom_text_buttom.dart';

import 'our_designs_screen.dart';
import 'our_packages_screen.dart';
import 'services_page.dart';

final designerProvider = Provider<List<String>>((ref) {
  return ["Designer 1", "Designer 2", "Designer 3", "Designer 4"];
});

class DesignerDetails extends ConsumerStatefulWidget {
  const DesignerDetails({super.key});
  @override
  _DesignerDetailsState createState() => _DesignerDetailsState();
}

class _DesignerDetailsState extends ConsumerState<DesignerDetails> {
  int _selectedIndex = 1;

 

  @override
  Widget build(BuildContext context,) {
    final designers = ref.watch(designerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Designer Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                Image.asset(
                  'assets/images/Designer.png',
                  width: double.infinity,
                  height: 472,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Arial Couture",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                          fontFamily: 'Gloock',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF75C44C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          minimumSize: const Size(90, 37),
                        ),
                        child: const Text("Open"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "456 Oak Street, Cityville, CA 90210",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "5 years of Experience",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFFFF7A00),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Ratings Section
                  Row(
                    children: [
                      Row(
                        children: List.generate(
                          4,
                          (index) => const Icon(
                            Icons.star,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.star_half,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      const Text("(75 reviews)"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Action Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildIconWithLabel(Icons.public, "Global"),
                      _buildIconWithLabel(Icons.call, "Call"),
                      _buildIconWithLabel(Icons.location_on, "Location"),
                      _buildIconWithLabel(Icons.chat, "Chat"),
                      _buildIconWithLabel(Icons.share, "Share"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Our Designers Section
                  const Text(
                    "Our Designers",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontFamily: 'Gloock',
                    ),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: designers.map((designer) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: DesignerCard(),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildHorizontalButton(onTap: (idx){
                    setState(() {
                                     _selectedIndex=idx;   
                                     log("message $idx");   
                                        });
                  }),
                  const SizedBox(height: 8),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Specialization: ",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              " High-Fashion Evening Gowns, Custom Wedding Dresses, Luxury Bespoke Tailoring.",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Services: ",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              "Custom Design Consultations, Garment Creation, Alterations.",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Aria Couture is a premier fashion atelier renowned for its dedication to elegance and timeless sophistication. Each custom piece is meticulously crafted, blending haute couture techniques with modern aesthetics.",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  // About Us Section
                 Visibility(
                  visible:  _selectedIndex==1, // tabIdx ==1
                  child:  AboutUsScreen(
                    
                  ),), 
                  // services
                 Visibility(
                  visible: _selectedIndex==2, // tabIdx ==2
                  child:  ServicesPage(), ), 

                  // our packages
                 Visibility(
                   visible: _selectedIndex==3, // tabIdx ==3
                  child:  PackageScreen(), ), 
                  // our designs
                 Visibility( visible: _selectedIndex==4,// tabIdx ==1
                 
                 child:  OurDesignsScreen(),), 

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
          ),
        ),
      ],
    );
  }


  Widget _buildHorizontalButton({required void Function(int) onTap}) {
  final buttonLabels = ["About us", "Services", "Packages", "Gallery"];
  
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: buttonLabels.asMap().entries.map((entry) {
            int index = entry.key;  // Get the index of the label
            String label = entry.value;  // Get the label itself
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CustomTextButton(
                
                text: label,
                onPressed: () {
                  onTap(index + 1); // Pass the index + 1
                },
              ),
            );
          }).toList(),
        ),
      ),
    ),
  );
}


}
