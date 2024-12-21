import 'package:flutter/material.dart';
import 'package:fry_guys/Screens/MapScreen.dart';
import 'package:fry_guys/Screens/SignUp.dart';
import '../Constants/Colors.dart';
import '../Constants/Fonts.dart';
import 'package:fry_guys/Screens/Login.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system overlay style to change status bar icons to white
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            Brightness.light, // This changes the icons to white
        statusBarColor:
            Colors.transparent, // Optional: make status bar transparent
      ),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/451244814_18014259224581411_3824275766741391515_n 2.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Adjusted to space between
            children: [
              // Skip Button
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MapScreen();
                          },
                        ),
                      );
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    child: Text(
                      'تخطى',
                      style: kMessiri_16.copyWith(color: yellow),
                    ),
                  ),
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Main Content
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 150),
                            Text(
                              'أهلا وسهلا بك فى',
                              style: kBigMessiri_40.copyWith(color: yellow),
                            ),
                            Text(
                              'FRY GUYS',
                              style: kMessiri52.copyWith(color: Colors.white),
                            ),
                            Text(
                              'حنا..... غيررررر',
                              style: kDimnah.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Registration Section
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 30), // Padding from the bottom
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 90,
                          child: Divider(color: Colors.white),
                        ),
                        Text(
                          ' سجل الأن ',
                          style: kDimnah.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 90,
                          child: Divider(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(70, 60),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return SignUp();
                            }),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: yellow,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'رقم الجوال',
                              style: kMessiri_14.copyWith(color: yellow),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Login();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: kMessiri_14.copyWith(
                              color: yellow,
                              decorationColor: yellow,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                            ),
                          ),
                        ),
                        Text('  لديك حساب بالفعل ',
                            style: kMessiri_16.copyWith(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
