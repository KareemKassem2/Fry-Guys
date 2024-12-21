import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Fonts.dart'; // Assume your font styles are in this file.

class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
    required this.text,
    required this.icon,
    this.iconColor = darkgrey,
    this.textStyle,
  });

  final String text;
  final IconData icon;
  final Color iconColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text,
          style: textStyle ?? kMessiri_16, // Use the provided style or fallback
        ),
        const SizedBox(width: 20),
        Icon(icon, color: iconColor),
      ],
    );
  }
}
