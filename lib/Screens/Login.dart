import 'package:flutter/material.dart';
import 'package:fry_guys/Components/HeaderPaint.dart';
import 'package:fry_guys/Constants/Colors.dart';
import 'package:fry_guys/Constants/Fonts.dart';
import 'package:fry_guys/Screens/MapScreen.dart';
import 'package:fry_guys/Screens/ResetPassword.dart';
import 'package:fry_guys/Screens/SignUp.dart';
import '../Components/InputCart.dart';

class Login extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomPaint(
          painter: HeaderPainter(),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تسجيل الدخول',
                          style: kMessiri_30,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InputCard(
                          label: 'رقم الجوال',
                          controller: phoneController,
                          isNumeric: true,
                        ),
                        InputCard(
                            label: 'كلمة المرور',
                            controller: passwordController,
                            isPassword: true),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Resetpassword();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'نسيت كلمة المرور',
                            style: kMessiri_14.copyWith(
                                color: yellow,
                                decorationColor: yellow,
                                decoration: TextDecoration.underline,
                                decorationThickness: 1.5),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(backgroundColor: yellow),
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
                          child: Text(
                            '  تسجيل الدخول  ',
                            style: kMessiri_30.copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return SignUp();
                                  }),
                                );
                              },
                              child: Text(
                                'إنشاء حساب',
                                style: kMessiri_16.copyWith(
                                    color: yellow,
                                    decorationColor: yellow,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.5),
                              ),
                            ),
                            Text(
                              'ليس لديك حساب',
                              style: kMessiri_16.copyWith(color: darkgrey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
