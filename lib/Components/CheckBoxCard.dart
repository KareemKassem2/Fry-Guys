import 'package:flutter/material.dart';
import '../Constants/Fonts.dart';
import '../Constants/Colors.dart';

class CheckboxCard extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(double) onChanged;

  const CheckboxCard({
    Key? key,
    required this.title,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckboxCardState createState() => _CheckboxCardState();
}

class _CheckboxCardState extends State<CheckboxCard> {
  late List<bool> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List<bool>.filled(widget.options.length, false);
  }

  void _updateTotalPrice() {
    double totalPrice = _selected.where((bool selected) => selected).length *
        14.0; // Example price per item
    widget.onChanged(totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Title
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.title,
              style: kMessiri_16.copyWith(color: Colors.grey),
            ),
          ),
        ),

        /// Content
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: List.generate(widget.options.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: CheckboxListTile(
                    value: _selected[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selected[index] = value ?? false;
                      });
                      _updateTotalPrice();
                    },
                    title: Text(
                      widget.options[index],
                      style: kMessiri_14.copyWith(color: darkgrey),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: yellow,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
