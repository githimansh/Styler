import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styler/src/feature/Home/home.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/Widgets/textfield.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/feature/Register/login_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool rememberMe = false;
  bool isPasswordVisible = false;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomBackButton(),
                  ),
                  const SizedBox(height: 0),
                  _buildHeader(),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: fullNameController,
                    hintText: 'Full Name',
                    prefixIcon: Icons.person_2_outlined,
                    validator: (value) => value == null || value.isEmpty ? 'Full Name is required' : null,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Email is required';
                      final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                      return !emailRegex.hasMatch(value) ? 'Enter a valid email address' : null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    obscureText: !isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        size: 24,
                        color: AppColors.iconColor,
                      ),
                      onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Password is required';
                      if (value.length < 6) return 'Password must be at least 6 characters';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    prefixIcon: Icons.lock,
                    obscureText: !isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        size: 24,
                        color: AppColors.iconColor,
                      ),
                      onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Confirm Password is required';
                      if (value != passwordController.text) return 'Passwords do not match';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      
                     Checkbox(
                        value: rememberMe,
                        onChanged: (value) => setState(() => rememberMe = value!),
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    buttonText: 'Sign up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "or continue with",
                    style: TextStyle(fontSize: 14, color: AppColors.textColor),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton('assets/images/image5.png'),
                      const SizedBox(width: 25),
                      _socialButton('assets/images/image6.png'),
                      const SizedBox(width: 20),
                      _socialButton('assets/images/image7.png'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPageScreen()),
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: AppColors.hintColor),
                        children: [
                          TextSpan(
                            text: "Sign in",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 199,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(60),
                ),
                alignment: Alignment.center,
                child: Text(
                  "S",
                  style: GoogleFonts.gloock(
                    fontSize: 64,
                    color: AppColors.background,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                "Styler.",
                style: GoogleFonts.gloock(
                  fontSize: 44,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Login to Your Account",
            style: GoogleFonts.gloock(
              fontSize: 30,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton(String assetPath) {
    return IconButton(
      icon: Image.asset(assetPath, width: 60, height: 60),
      onPressed: () {
        // Handle social media button click here
      },
    );
  }
}
