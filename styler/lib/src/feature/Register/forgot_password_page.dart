import 'package:flutter/material.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/feature/Register/forgot_password_otp_page.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isSmsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            _buildImage(),
            const SizedBox(height: 30),
            _buildInstructionText(),
            const SizedBox(height: 30),
            _buildContactOption(
              icon: Icons.sms,
              label: 'Via SMS',
              detail: '+91 111 ******99',
              isSelected: isSmsSelected,
              onTap: () => _selectOption(true),
            ),
            const SizedBox(height: 16),
            _buildContactOption(
              icon: Icons.email,
              label: 'Via Email',
              detail: 'neha****gh@gmail.com',
              isSelected: !isSmsSelected,
              onTap: () => _selectOption(false),
            ),
            const Spacer(),
            CustomButton(
              buttonText: 'Continue',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordOTPPageScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: const CustomBackButton(),
      title: const Text(
        'Forgot Password',
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      'assets/images/forgot_password.png',
      height: 280,
      fit: BoxFit.cover,
    );
  }

  Widget _buildInstructionText() {
    return const Text(
      'Select which contact details should we use to reset your password',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.hintColor,
      ),
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String label,
    required String detail,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF2ED) : AppColors.background,
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.buttonColor : Colors.grey,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    detail,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
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

  void _selectOption(bool isSms) {
    setState(() {
      isSmsSelected = isSms;
    });
  }
}
