import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;

  const CustomBackButton({
    super.key,
    this.backgroundColor = const Color(0xFFFFF2ED),
    this.iconColor = const Color(0xFF531A02),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: CircleAvatar(
          backgroundColor: backgroundColor,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: iconColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
