import 'package:flutter/material.dart';
import '../Constants/Fonts.dart';
import '../Constants/Colors.dart';

class InputCard extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final bool isNumeric;
  final bool isName;

  const InputCard({
    Key? key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.isNumeric = false,
    this.isName = false,
  }) : super(key: key);

  @override
  _InputCardState createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  bool _obscureText = true;

  // List of countries with flags and dial codes
  final List<Map<String, String>> countries = [
    {
      "code": "SA",
      "name": "Saudi Arabia",
      "dialCode": "+966",
      "flag": "assets/flags/saudi_arabia.png"
    },
    {
      "code": "EG",
      "name": "Egypt",
      "dialCode": "+20",
      "flag": "assets/flags/egypt.png"
    },
    // Add more countries as needed
  ];

  // Selected country code
  String selectedCountryCode = "SA";

  String getHintText() {
    if (widget.isNumeric) {
      return "أدخل رقم الجوال";
    } else if (widget.isPassword) {
      return "أدخل كلمة المرور";
    }
    return "أدخل النص";
  }

  @override
  Widget build(BuildContext context) {
    // Find the selected country's details
    countries.firstWhere((country) => country["code"] == selectedCountryCode);

    return Column(
      children: [
        /// Title
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.label,
              style: kMessiri_16.copyWith(color: Colors.grey),
            ),
          ),
        ),

        /// Content
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
          child: Card(
            elevation: 20,
            shadowColor: Colors.white.withOpacity(0.7),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: yellow),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    if (widget.isNumeric)
                      DropdownButton<String>(
                        value: selectedCountryCode,
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCountryCode = newValue!;
                          });
                        },
                        underline: SizedBox(), // Remove the underline
                        items: countries.map((country) {
                          return DropdownMenuItem<String>(
                            value: country["code"],
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    image: DecorationImage(
                                      image: AssetImage(country["flag"]!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  country["dialCode"]!,
                                  style: kMessiri_16.copyWith(color: darkgrey),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),

                    /// Input Field
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.black,
                        controller: widget.controller,
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove inner black border
                          hintText: getHintText(),
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: widget.isPassword
                              ? IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                )
                              : null,
                        ),
                        textAlign: TextAlign.right,
                        style: kMessiri_20.copyWith(color: darkgrey),
                        obscureText: widget.isPassword ? _obscureText : false,
                        keyboardType: widget.isNumeric
                            ? TextInputType.number
                            : TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
