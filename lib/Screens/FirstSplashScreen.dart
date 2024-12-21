import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'SecondSplashScreen.dart';

// First Splash Screen
class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});

  @override
  _FirstSplashScreenState createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Transition to Second Splash Screen after 1 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration:
              const Duration(milliseconds: 600), // Set 1-second transition
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SecondSplashScreen(),
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
      backgroundColor: const Color(0xffffffff),
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
