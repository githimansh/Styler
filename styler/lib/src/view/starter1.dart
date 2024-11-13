import 'package:flutter/material.dart';
import 'package:styler/src/utlis/AppColors.dart';
import 'package:styler/src/view/starter2.dart'; // Import AppColors

class FashionHubScreen extends StatelessWidget {
  const FashionHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.65,
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
                color: AppColors.background, // Use AppColors for background color
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildDot(isActive: true, color: AppColors.secondary), // Use AppColors for dot color
                              _buildDot(isActive: false, color: AppColors.hintColor), // Use AppColors for inactive dot color
                              _buildDot(isActive: false, color: AppColors.hintColor),
                            ],
                          ),
                          SizedBox(height: 24),
                          Text(
                            "Welcome to Styler – Your Personalized Fashion Hub!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Gloock',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: AppColors.secondary, // Use AppColors for text color
                            ),
                          ),
                          SizedBox(height: 48),
                          Text(
                            "Discover fashion designers, tailors, and branded clothing curated just for you. Let’s get started with your unique style journey!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                              color: AppColors.textColor, // Use AppColors for text color
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 72.73,
                            height: 72.73,
                            decoration: BoxDecoration(
                              color: AppColors.secondary, // Use AppColors for circle background
                              shape: BoxShape.circle,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              backgroundColor: AppColors.secondary, // Use AppColors for button background
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FashionExpertsScreen()),
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
      height: isActive ? 15 : 15,
      width: isActive ? 15 : 15,
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
