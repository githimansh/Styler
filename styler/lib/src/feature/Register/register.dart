import 'package:flutter/material.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/feature/Register/register_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(context),  
          Positioned(
            top: MediaQuery.of(context).size.height * 0.42,
            left: MediaQuery.of(context).size.width / 2 - 185,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeaderText(),
                    const SizedBox(height: 12),
                    _buildSocialButton(
                      text: 'Continue with Google',
                      imagePath: 'assets/images/image5.png',
                      backgroundColor: AppColors.background,
                      borderColor: AppColors.hintColor,
                      textColor: AppColors.textColor,
                    ),
                    const SizedBox(height: 12),
                    _buildSocialButton(
                      text: 'Continue with Facebook',
                      imagePath: 'assets/images/image6.png',
                      backgroundColor: AppColors.background,
                      borderColor: AppColors.hintColor,
                      textColor: AppColors.textColor,
                    ),
                    const SizedBox(height: 12),
                    _buildInstagramButton(),
                    const SizedBox(height: 10),
                    _buildOrText(),
                    const SizedBox(height: 10),
                    _buildEmailSignInButton(context),
                    const SizedBox(height: 12),
                    _buildSignUpOption(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {  
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image4.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Text(
      "Let's you in!",
      style: const TextStyle(
        fontSize: 28,
        fontFamily: 'Gloock',
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildSocialButton({
    required String text,
    required String imagePath,
    required Color backgroundColor,
    Color? borderColor,
    required Color textColor,
  }) {
    return Container(
      width: double.infinity,
      height: 58,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor ?? AppColors.hintColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 60, width: 60),
          const SizedBox(width: 00),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstagramButton() {
    return Container(
      width: double.infinity,
      height: 58,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.hintColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/image7.png', height: 50, width: 50),
          const SizedBox(width: 0),
          Text(
            'Continue as a Partner',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'or',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailSignInButton(BuildContext context) {
    return CustomButton(
      buttonText: 'Sign In with email',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      },
    );
  }

  Widget _buildSignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: AppColors.hintColor),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign up',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
