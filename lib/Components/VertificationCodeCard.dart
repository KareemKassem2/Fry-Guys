import 'package:flutter/material.dart';
import '../Constants/Fonts.dart';
import '../Constants/Colors.dart';

class VerificationCodeCard extends StatefulWidget {
  final String label;
  final bool isNumeric;

  const VerificationCodeCard({
    super.key,
    required this.label,
    this.isNumeric = true,
  });

  @override
  _VerificationCodeCardState createState() => _VerificationCodeCardState();
}

class _VerificationCodeCardState extends State<VerificationCodeCard> {
  final List<TextEditingController> _controllers = List.generate(
      4, (_) => TextEditingController()); // Create controllers dynamically

  // List to track the border colors of each digit box
  final List<Color> _borderColors = List.generate(4, (_) => lightgrey);

  @override
  void dispose() {
    // Dispose of controllers to free resources
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildDigitCard(int index) {
    return Card(
      elevation: 20,
      shadowColor: Colors.white.withOpacity(0.7),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: 70, // Width for each card
        height: 70, // Height for each card
        decoration: BoxDecoration(
          border: Border.all(color: _borderColors[index], width: 1.2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          // Ensures content is centered
          child: TextField(
            controller: _controllers[index],
            keyboardType:
                widget.isNumeric ? TextInputType.number : TextInputType.text,
            textAlign: TextAlign.center,
            maxLength: 1,
            onChanged: (value) {
              setState(() {
                _borderColors[index] = value.isNotEmpty ? yellow : lightgrey;
              });
              if (value.isNotEmpty && index < _controllers.length - 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none, // Remove default border
              isCollapsed: true, // Ensures no extra padding
            ),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: yellow,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Title
        Align(
          alignment: Alignment.center,
          child: Text(widget.label,
              style: kMessiri_16.copyWith(color: Colors.grey)),
        ),

        /// Separate Squares
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) => _buildDigitCard(index)),
          ),
        ),
      ],
    );
  }
}
