import 'package:flutter/material.dart';
import 'package:fry_guys/Components/HeaderPaint.dart';
import 'package:fry_guys/Constants/Colors.dart';
import 'package:fry_guys/Constants/Fonts.dart';
import 'package:fry_guys/Screens/SignUp.dart';
import '../Components/InputCart.dart';
import 'VertificationCode.dart';

class PhoneRegistration extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  PhoneRegistration({super.key});

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
                  Text(
                    'رقم الجوال',
                    style: kMessiri_30.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'للتسجيل يجب إضافة رقم الجوال',
                    style: kMessiri_14.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputCard(
                    label: '',
                    controller: phoneController,
                    isNumeric: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: yellow),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Vertificationcode();
                        }),
                      );
                    },
                    child: Text(
                      '   إرسال   ',
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUp();
                          }));
                        },
                        child: Text(
                          'إنشاء حساب جديد',
                          style: kMessiri_16.copyWith(
                            color: yellow,
                            decorationColor: yellow,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.5,
                          ),
                        ),
                      ),
                      Text(
                        'ليس لديك حساب',
                        style: kMessiri_16.copyWith(color: Colors.black),
                      ),
                    ],
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
