import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,  
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),  
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,  
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
