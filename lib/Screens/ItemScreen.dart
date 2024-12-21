import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fry_guys/Components/CheckBoxCard.dart';
import 'package:fry_guys/Constants/Colors.dart';
import 'package:fry_guys/Constants/Fonts.dart';
import 'package:fry_guys/Screens/BasketScreen.dart';

class ItemScreen extends StatefulWidget {
  final String mealName;
  final String imagePath;
  final String description;
  final double price;

  ItemScreen({
    Key? key,
    required this.mealName,
    required this.imagePath,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  double _addonsPrice = 0.0;
  List<String> _selectedItems = [];
  double _totalCartPrice = 0.0;

  void _updateAddonsPrice(double price) {
    setState(() {
      _addonsPrice = price;
    });
  }

  void _updateSelectedItems(List<String> items) {
    setState(() {
      _selectedItems = items;
    });
  }

  void _addToCart(double mealPrice) {
    setState(() {
      _totalCartPrice += mealPrice + _addonsPrice;
    });
    _showSnackbar(context, _totalCartPrice);
  }

  void _showSnackbar(BuildContext context, double totalPrice) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المجموع: $totalPrice SR',
                style: kMessiri_16.copyWith(color: Colors.white),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasketScreen(
                        selectedItems: _selectedItems,
                        totalPrice: totalPrice,
                      ),
                    ),
                  );
                },
                child: Text(
                  'عرض السلة',
                  style: kMessiri_16.copyWith(color: yellow),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: yellow,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double basePrice = widget.price;
    double totalPrice = basePrice + _addonsPrice;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: yellow,
        centerTitle: true,
        title: Text(
          totalPrice.toStringAsFixed(2), // Display total price
          style: kMessiri_16.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Display the image
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  widget.imagePath,
                ),
              ),
              SizedBox(height: 20),
              // Display the meal name
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.mealName,
                          style: kMessiri_20.copyWith(color: darkgrey),
                        ),
                        Text(
                          widget.description,
                          style: kMessiri_10.copyWith(color: darkgrey),
                        ),
                      ],
                    ),
                    const SizedBox(width: 50),
                    Text(
                      '${widget.price} SR',
                      style: kMessiri_14.copyWith(color: yellow),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 1.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'اختر الإضافات',
                    style: kMessiri_20.copyWith(color: darkgrey),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Add-ons Section using CheckboxCard
              CheckboxCard(
                title: 'اختر الإضافات',
                options: ['Option 1', 'Option 2', 'Option 3'],
                onChanged: (price) => _updateAddonsPrice(price),
              ),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'المجموع $totalPrice SR',
                      style: kMessiri_20.copyWith(color: yellow),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset('assets/icons/Basket.svg')
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: yellow),
                  onPressed: () {
                    _addToCart(basePrice);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 90),
                    child: Text(
                      ' إضافة إلى السلة',
                      style: kMessiri_20.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
