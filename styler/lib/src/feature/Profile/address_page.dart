import 'package:flutter/material.dart';
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
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Text(
            'Fill Your Address',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CustomTextField(
                hintText: 'Address 1', controller: address1Controller),
            const SizedBox(height: 20),
            CustomTextField(
                hintText: 'Address 2', controller: address2Controller),
            const SizedBox(height: 20),
            CustomTextField(
                hintText: 'Landmark', controller: landmarkController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'City', controller: cityController),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'State', controller: stateController),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Pincode',
              controller: pincodeController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Country', controller: countryController),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Continue',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OTPPageScreen()),
                );
              },
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 140),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.brown),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.brown,
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
