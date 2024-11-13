import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/view/starter3.dart';
// import 'package:styler/src/common/app_colors.dart'; // Import AppColors

class FashionExpertsScreen extends StatelessWidget {
  const FashionExpertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: SemiCircleClipper(),
              child: Container(
                color: AppColors.background, // Use AppColors for background
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(isActive: false, color: AppColors.hintColor), // Inactive dot
                          _buildDot(isActive: true, color: AppColors.secondary), // Active dot
                          _buildDot(isActive: false, color: AppColors.hintColor),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Connect with Top Fashion Experts in Your Area",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Gloock',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          color: AppColors.secondary, // Use AppColors for text
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Browse designer profiles, explore portfolios, and book custom services like alterations or consultations with just a tap.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          color: AppColors.textColor, // Use AppColors for text color
                        ),
                      ),
                      Spacer(),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: AppColors.secondary, // Use AppColors for button background
                              shape: BoxShape.circle,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              backgroundColor: AppColors.secondary, // Use AppColors for button color
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShopScreen()),
                              );
                            },
                            child: Icon(
                              Icons.arrow_right_alt,
                              color: AppColors.background, // Use AppColors for icon color
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
    path.lineTo(0.0, size.height - 100);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 100);

    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}