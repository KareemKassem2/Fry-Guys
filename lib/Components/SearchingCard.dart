import 'package:flutter/material.dart';
import '../Constants/Fonts.dart';
import '../Constants/Colors.dart';

class SearchingCard extends StatelessWidget {
  final TextEditingController controller;

  const SearchingCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        color: lightgrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: brown),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'ابحث عن وجبتك المفضلة',
                        hintStyle: TextStyle(color: brown.withOpacity(0.5)),
                        border: InputBorder.none,
                      ),
                      style: kMessiri_14.copyWith(color: darkgrey),
                    ),
                  ),
                  Icon(Icons.search, color: brown),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
