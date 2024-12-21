import 'package:flutter/material.dart';
import 'package:fry_guys/Components/HeaderPaint.dart';
import 'package:fry_guys/Constants/Colors.dart';
import 'package:fry_guys/Constants/Fonts.dart';
import '../Components/VertificationCodeCard.dart';

class Vertificationcode extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Vertificationcode({super.key});

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'رمز التفعيل',
                        style: kMessiri_30.copyWith(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 50.0, left: 50, top: 10),
                        child: Text(
                          'من فضلك أدخل رمز التفعيل الذي تم إرساله على رقم الجوال الخاص بك',
                          style: kMessiri_14.copyWith(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const VerificationCodeCard(
                        label: '',
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'إرسال رمز التفعيل مجددًا.',
                              style: kMessiri_16.copyWith(
                                  color: yellow,
                                  decorationColor: yellow,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1.5),
                            ),
                          ),
                          Text(
                            'لم يصل رمز التفعيل ؟',
                            style: kMessiri_16.copyWith(color: darkgrey),
                          ),
                        ],
                      )
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
