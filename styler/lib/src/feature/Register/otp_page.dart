import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/feature/Register/opt_popup_screen.dart';

class OTPPageScreen extends StatelessWidget {
  const OTPPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomBackButton(),
                const SizedBox(height: 30),
                _buildLogoAndTitle(),
                const SizedBox(height: 30),
                _buildOTPText(),
                const SizedBox(height: 40),
                _buildOTPFields(),
                const SizedBox(height: 40),
                _buildContinueButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoAndTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogoCircle(),
            const SizedBox(width: 4),
            _buildTitleText(),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          "Add Your OTP Code",
          style: GoogleFonts.gloock(
            fontSize: 32,
            height: 1.2, 
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildLogoCircle() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        "S",
        style: GoogleFonts.gloock(
          fontSize: 74,
          height: 1.2,
          color: AppColors.background,
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(
      "Styler.",
      style: GoogleFonts.gloock(
        fontSize: 54,
        height: 1.2,
        color: AppColors.accent,
      ),
    );
  }

  Widget _buildOTPText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          _textSpan("Please enter the ", AppColors.hintColor),
          _textSpan("OTP sent", AppColors.secondary),
          _textSpan(" to your phone number below to verify", AppColors.hintColor),
        ],
      ),
    );
  }

  static TextSpan _textSpan(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildOTPFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 60,
          height: 60,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
          ),
        );
      }),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomButton(
      buttonText: 'Continue',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OTPPopupScreen()),
        );
      },
    );
  }
}
