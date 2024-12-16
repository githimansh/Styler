import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/Widgets/textfield.dart';
import 'package:styler/src/feature/Register/otp_page.dart';

class FillAddressScreen extends StatefulWidget {
  const FillAddressScreen({super.key});

  @override
  _FillAddressScreenState createState() => _FillAddressScreenState();
}

class _FillAddressScreenState extends State<FillAddressScreen> {
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final landmarkController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pincodeController = TextEditingController();
  final countryController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    address1Controller.addListener(_validateForm);
    address2Controller.addListener(_validateForm);
    landmarkController.addListener(_validateForm);
    cityController.addListener(_validateForm);
    stateController.addListener(_validateForm);
    pincodeController.addListener(_validateForm);
    countryController.addListener(_validateForm);
  }

  @override
  void dispose() {
    address1Controller.removeListener(_validateForm);
    address2Controller.removeListener(_validateForm);
    landmarkController.removeListener(_validateForm);
    cityController.removeListener(_validateForm);
    stateController.removeListener(_validateForm);
    pincodeController.removeListener(_validateForm);
    countryController.removeListener(_validateForm);
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      isButtonEnabled = address1Controller.text.isNotEmpty &&
          address2Controller.text.isNotEmpty &&
          landmarkController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          stateController.text.isNotEmpty &&
          pincodeController.text.isNotEmpty &&
          countryController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Text(
            'Fill Your Address',
            style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
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
            CustomTextField(hintText: 'Address 1', controller: address1Controller),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Address 2', controller: address2Controller),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Landmark', controller: landmarkController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'City', controller: cityController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'State', controller: stateController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Pincode', controller: pincodeController, keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Country', controller: countryController),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Continue',
              onPressed:
                  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OTPPageScreen()),
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
