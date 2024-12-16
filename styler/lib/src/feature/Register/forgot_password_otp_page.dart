import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styler/src/utlis/Widgets/Custom_Buttom.dart';
import 'package:styler/src/utlis/Widgets/back_button.dart';
import 'package:styler/src/utlis/AppColors.dart';

class ForgotPasswordOTPPageScreen extends StatefulWidget {
  const ForgotPasswordOTPPageScreen({super.key});

  @override
  _ForgotPasswordOTPPageScreenState createState() =>
      _ForgotPasswordOTPPageScreenState();
}

class _ForgotPasswordOTPPageScreenState
    extends State<ForgotPasswordOTPPageScreen> {
  final List<TextEditingController> controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomBackButton(),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150),
                _buildOTPText(),
                const SizedBox(height: 50),
                _buildOTPFields(),
                const SizedBox(height: 50),
                CustomButton(
                  buttonText: "Verify",
                  onPressed: _onVerifyPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOTPText() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: "Code has been sent to ",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: "+91 111*******99",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOTPFields() {
    return Form(
      key: _formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double fieldWidth = constraints.maxWidth > 600 ? 80 : 60;
          double fontSize = constraints.maxWidth > 600 ? 28 : 24;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return SizedBox(
                width: fieldWidth,
                height: fieldWidth,
                child: TextFormField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a digit';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty && RegExp(r'^[0-9]$').hasMatch(value)) {
                      if (index < focusNodes.length - 1) {
                        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                      } else {
                        focusNodes[index].unfocus();
                      }
                    } else if (value.isEmpty) {
                      controllers[index].clear();
                    } else {
                      controllers[index].clear();
                    }
                  },
                ),
              );
            }),
          );
        },
      ),
    );
  }

  void _onVerifyPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // Check if all OTP fields are filled
      String otp = controllers.map((controller) => controller.text).join();
      if (otp.length == 4) {
        // OTP is valid, navigate to the next screen
        context.go('/otp-popup');
      } else {
        // Handle case where OTP is incomplete (although this shouldn't happen with validation)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter all digits of the OTP.')),
        );
      }
    }
  }
}
