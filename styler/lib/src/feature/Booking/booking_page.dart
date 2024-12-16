import 'package:flutter/material.dart';
import 'package:styler/src/feature/Booking/InPerson.dart';
import 'package:styler/src/feature/Booking/measurenments.dart';
import 'package:styler/src/feature/Booking/virtual_consultation.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/Widgets/custom_text_buttom.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        leading: CustomBackButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Business Details Section
          const Text(
            'Aria Couture',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
          const SizedBox(height: 4),
          const Text(
            '456 Oak Street, Cityville, CA 90210',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ...List.generate(
                4,
                (index) => const Icon(Icons.star, color: Colors.amber),
              ),
              const Icon(Icons.star_border, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                '(75) Reviews',
                style: TextStyle(color: Colors.red.shade600, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 26),

          // Service Selection Section
          const Text(
            "Service Selection",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 6,
            children: [
              CustomTextButton(text: 'Tailoring',  onPressed: (){}),
              SizedBox(width: 6,),
              CustomTextButton(text: 'Alterations', onPressed: (){}),
              SizedBox(width: 6,),
              CustomTextButton(text: 'Custom Design', onPressed: (){}),
              
            ],
          ),
          const SizedBox(height: 16),

          // Our Services Section
          Text(
            "Our Services",
            style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Luxury Custom Apparel',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Custom Requirements',

              // borderRadius: BorderRadius.circular(8.0),
            ),
            maxLines: 8,
          ),
          const SizedBox(height: 16),

          // Measurements Section
          const Text(
            "Measurements",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              CustomTextButton(text: 'N/A', width: 182, height: 51, onPressed: (){}),
              SizedBox(width: 8,),
              CustomTextButton(text: 'Add Measurement',width: 182, height: 51, onPressed: (){
                 Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddMeasurementsScreen()),
                      );
              }),
              
            ],
          ),
          const SizedBox(height: 26),

          // Consultation Section
                    const Text(
            "Consultation",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 16,),
          Row(
            children: [
             CustomTextButton(text: 'In-Person', width: 182, height: 51, onPressed: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InPersonConsultationScreen()),
                      ); 
             }),
              SizedBox(width: 8,),
              CustomTextButton(text: 'Virtual', width: 182, height: 51, onPressed: (){
                              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VirtualConsultationScreen(),),
                      ); 
              }),
              
            ],
          ),
          const SizedBox(height: 16),

          // Try These Services Section
                    Text(
            "Try these services",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ServiceItem(
                imagePath: 'assets/images/service1.png',
                label: 'Custom Design',
              ),
              ServiceItem(
                imagePath: 'assets/images/service2.png',
                label: 'Ready-to-Wear',
              ),
              ServiceItem(
                imagePath: 'assets/images/service3.png',
                label: 'Custom Design',
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Appointment Button
          SizedBox(
            width: double.infinity,
            child: CustomButton(buttonText: 'Appointment',)
          ),
        ],
      ),
    );
  }
}



class ServiceItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const ServiceItem({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 40,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
