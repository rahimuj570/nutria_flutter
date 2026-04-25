import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_option_main_holder.dart';
import 'package:neutria/presentations/common/view/screens/home_navigation_holder_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String name = "welcome_screen";

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    AppAssetsPath.welcomeHeadHero,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(AppAssetsPath.welcomeHeadHeroOverlay),
                ),
                Positioned(
                  bottom: -20, // move curve upward
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: CustomCliperPath(),
                    child: Container(
                      height: 100,
                      color: ConstColors.lightScafoldColor,
                    ),
                  ),
                ),
              ],
            ),
            // Curve overlaps upward

            // Text section
            Container(
              padding: const EdgeInsets.all(33),
              width: double.infinity,
              color: ConstColors.lightScafoldColor,
              child: Column(
                children: [
                  const Text(
                    "Welcome!!",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 31),
                  const Text(
                    "Calorie tracking made easy",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Just snap a quick photo of your meal and we’ll do the rest",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 115),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, ChooseOptionMainHolder.name);
                      Navigator.pushNamed(
                        context,
                        HomeNavigationHolderScreen.name,
                      );
                    },
                    child: Text(
                      "Get Started Now!!",
                      style: TextStyle(fontSize: 16, fontWeight: .w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCliperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    double radius = 10; // corner radius

    Path path = Path();

    // Start bottom-left
    path.moveTo(0, h);

    // Left side up
    path.lineTo(0, radius);

    // Top-left rounded corner
    path.quadraticBezierTo(0, 0, radius, 0);

    // Curve across top
    path.quadraticBezierTo(w * 0.5, h + 50, w - radius, 0);

    // Top-right rounded corner
    path.quadraticBezierTo(w, 0, w, radius);

    // Right side down
    path.lineTo(w, h);

    // Close back to bottom-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// class CustomCliperPath extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = size.width;
//     double h = size.height;

//     final Path path = Path();
//     path.quadraticBezierTo(w * .5, h + 50, w, 0);
//     // path.lineTo(w, 0);
//     path.lineTo(w, h);
//     path.lineTo(0, h);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
