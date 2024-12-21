// Second Splash Screen
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'OnboardingScreen.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  _SecondSplashScreenState createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration:
              const Duration(milliseconds: 800), // Set 1-second transition
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define easing and fade transition
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.easeOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var fadeAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbb72e),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            'assets/Group 18178.svg',
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SvgPicture.asset(
              'assets/Fry Guys.svg',
              width: 100,
              height: 100,
            ),
          ),
        ]),
      ),
    );
  }
}
