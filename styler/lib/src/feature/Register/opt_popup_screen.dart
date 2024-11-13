import 'dart:async';
import 'package:flutter/material.dart';
import 'package:styler/src/feature/Home/home.dart';

class OTPPopupScreen extends StatefulWidget {
  const OTPPopupScreen({super.key});

  @override
  _OTPPopupScreenState createState() => _OTPPopupScreenState();
}
class _OTPPopupScreenState extends State<OTPPopupScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, size: 60, color: Colors.black),
            SizedBox(height: 20),
            Text(
              "Congratulations!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              "Your account is ready to use. You will be redirected to the Home page in a few seconds.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
