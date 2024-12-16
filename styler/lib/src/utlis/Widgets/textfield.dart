import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? prefixText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyboardType;
  final String? labelText;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth > 600 ? 18 : 16;

        return TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            hintStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFA0A2A2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFFFCFCFC),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Colors.black54)
                : (prefixText != null
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: prefixText,
                      )
                    : null),
            suffixIcon: suffixIcon,
          ),
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),
          textAlign: TextAlign.start,
          validator: validator,
        );
      },
    );
  }
}
