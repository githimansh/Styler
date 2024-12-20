import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/feature/Register/register.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.65,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: SemiCircleClipper(),
              child: Container(
                color: AppColors.background,
                height: screenHeight * 0.5,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(isActive: false, color: AppColors.hintColor),
                          _buildDot(isActive: false, color: AppColors.hintColor),
                          _buildDot(isActive: true, color: AppColors.buttonColor),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Shop, Customize, and Track Your Orders Seamlessly",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Gloock',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 48),
                      Text(
                        "Whether you're shopping branded clothing or ordering custom designs, easily manage everything from your Styler dashboard",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          color: AppColors.textColor,
                        ),
                      ),
                      Spacer(),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 72.73,
                            height: 72.73,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              backgroundColor: AppColors.buttonColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OnboardingScreen()),
                              );
                            },
                            child: Icon(
                              Icons.arrow_right_alt,
                              color: AppColors.background,
                              size: 54,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({bool isActive = false, required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 100);

    var firstControlPoint = Offset(size.width / 2, 0.0);
    var firstEndPoint = Offset(size.width, 100);

    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
