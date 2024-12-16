import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/Widgets/textfield.dart';
import 'package:styler/src/feature/Register/otp_page.dart';

class AddMeasurementsScreen extends StatefulWidget {
  const AddMeasurementsScreen({super.key});

  @override
  _AddMeasurementsScreenState createState() => _AddMeasurementsScreenState();
}

class _AddMeasurementsScreenState extends State<AddMeasurementsScreen> {
  final TextEditingController bustController = TextEditingController();
  final TextEditingController waistController = TextEditingController();
  final TextEditingController hipsController = TextEditingController();
  final TextEditingController shoulderController = TextEditingController();
  final TextEditingController armController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  bool isButtonEnabled = false;


  @override
  void dispose() {
    bustController.dispose();
    waistController.dispose();
    hipsController.dispose();
    shoulderController.dispose();
    armController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Text(
            'Add Measurements',
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Bust', controller: bustController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Waist', controller: waistController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Hips', controller: hipsController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Shoulder Width', controller: shoulderController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Arm Length', controller: armController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Height', controller: heightController),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Custom Requirements',
                // border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Continue',
              onPressed:
                   () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OTPPageScreen()),
                      );
                    }
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 140),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Back',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
