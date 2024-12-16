import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
   // Changed to double for better accuracy
  final VoidCallback onPressed;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.height,
    this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: AppColors.primary,
              width: 1,
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
