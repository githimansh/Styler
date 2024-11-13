import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart'; 
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/Widgets/textfield.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/feature/Profile/profile_page.dart';
import 'package:styler/src/feature/Register/forgot_password_page.dart';
import 'package:styler/src/feature/Register/register_page.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


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
                
              
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 16),
                
                
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: !_isPasswordVisible, 
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      size: 24,
                      color: AppColors.iconColor, 
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                _buildRememberMeCheckbox(),
                SizedBox(height: 20),
                
                CustomButton(
                  buttonText: 'Sign in',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FillProfileScreen()),
                    );
                  },
                ),
                SizedBox(height: 20),
                
                _buildForgetText(),
                SizedBox(height: 20),
                
          
                _buildSocialLoginText(),
                SizedBox(height: 20),
                
              
                _buildSocialLoginButtons(),
                SizedBox(height: 20),
                
              
                _buildSignUpPrompt(context),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildLogoAndTitle() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primary, 
                  borderRadius: BorderRadius.circular(60), 
                ),
                alignment: Alignment.center,
                child: Text(
                  "S",
                  style: GoogleFonts.gloock(
                    fontSize: 74,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 4),
              
              Text(
                "Styler.",
                style: GoogleFonts.gloock(
                  fontSize: 54,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Page Title
          Text(
            "Login to Your Account",
            style: GoogleFonts.gloock(
              fontSize: 32,
              color: AppColors.buttonColor, 
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value!;
            });
          },
          activeColor: AppColors.secondary, 
        ),
        Text(
          "Remember me",
          style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildForgetText() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
        );
      },
      child: const Text(
        "Forgot the password?",
        style: TextStyle(
          color: AppColors.buttonColor, 
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
  Widget _buildSocialLoginText() {
    return const Text(
      "or continue with",
      style: TextStyle(
        fontSize: 14, 
        color: AppColors.textColor, 
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialButton('assets/images/image5.png'),
        SizedBox(width: 20),
        _socialButton('assets/images/image6.png'),
        SizedBox(width: 20),
        _socialButton('assets/images/image7.png'),
      ],
    );
  }

  Widget _socialButton(String assetPath) {
    return IconButton(
      icon: Image.asset(assetPath, width: 40, height: 40),
      onPressed: () {
      },
    );
  }

  Widget _buildSignUpPrompt(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      },
      child: Text.rich(
        TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(color: AppColors.hintColor), 
          children: [
            const TextSpan(
              text: "Sign up",
              style: TextStyle(
                color: AppColors.buttonColor, 
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
