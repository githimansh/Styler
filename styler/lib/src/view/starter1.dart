import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/view/starter2.dart';

class FashionHubScreen extends StatelessWidget {
  const FashionHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.65,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image1.png'),
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
                height: screenHeight * 0.55,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.05,
                    horizontal: screenWidth * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(context, isActive: true, color: AppColors.buttonColor),
                          _buildDot(context, isActive: false, color: AppColors.hintColor),
                          _buildDot(context, isActive: false, color: AppColors.hintColor),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Welcome to Styler – Your Personalized Fashion Hub!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Gloock',
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Text(
                        "Discover fashion designers, tailors, and branded clothing curated just for you. Let’s get started with your unique style journey!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: screenWidth * 0.035,
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
                            width: screenWidth * 0.14,
                            height: screenWidth * 0.14,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(screenWidth * 0.05),
                              backgroundColor: AppColors.buttonColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FashionExpertsScreen()),
                              );
                            },
                            child: Icon(
                              Icons.arrow_right_alt,
                              color: AppColors.background,
                              size: screenWidth * 0.14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.025),
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

  Widget _buildDot(BuildContext context, {bool isActive = false, required Color color}) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.012),
      height: screenWidth * 0.15,
      width: screenWidth * 0.04,
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
    final path = Path();
    path.lineTo(0.0, 100);

    final firstControlPoint = Offset(size.width / 2, 0.0);
    final firstEndPoint = Offset(size.width, 100);

    path.quadraticBezierTo(
      firstControlPoint.dx, 
      firstControlPoint.dy, 
      firstEndPoint.dx, 
      firstEndPoint.dy,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
