import 'package:flutter/material.dart';
import 'package:fry_guys/Components/HeaderPaint.dart';
import 'package:fry_guys/Constants/Colors.dart';
import 'package:fry_guys/Constants/Fonts.dart';
import 'package:fry_guys/Screens/Login.dart';
import 'package:fry_guys/Screens/PhoneRegistration.dart';

import '../Components/InputCart.dart';

class SignUp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkaPsswordController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: CustomPaint(
            painter: HeaderPainter(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          'التسجيل',
                          style: kMessiri_30,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        InputCard(
                          label: 'الإسم',
                          controller: nameController,
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
                        InputCard(
                            label: 'تأكيد كلمة المرور',
                            controller: checkaPsswordController,
                            isPassword: true),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(backgroundColor: yellow),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return PhoneRegistration();
                              }),
                            );
                          },
                          child: Text(
                            '  إنشاء حساب  ',
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
                                    return Login();
                                  }),
                                );
                              },
                              child: Text(
                                'تسجيل الدخول',
                                style: kMessiri_16.copyWith(
                                    color: yellow,
                                    decorationColor: yellow,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.5),
                              ),
                            ),
                            Text(
                              'لديك حساب بالفعل',
                              style: kMessiri_16.copyWith(color: darkgrey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
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
