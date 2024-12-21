import 'package:flutter/material.dart';
import '../Constants/Fonts.dart';
import '../Constants/Colors.dart';

class SectionListView extends StatelessWidget {
  final List<Map<String, String>> sectionItems;

  const SectionListView({
    Key? key,
    required this.sectionItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: 70, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sectionItems.length,
            itemBuilder: (context, index) {
              final item = sectionItems[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: yellow,
                    padding: EdgeInsets.all(6),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          item["title"] ?? "",
                          style: kMessiri_16.copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundImage: AssetImage(item["image"] ?? ""),
                        radius: 28,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
