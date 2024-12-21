import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fry_guys/Constants/Colors.dart';
import 'package:fry_guys/Constants/Fonts.dart';
import 'package:fry_guys/Screens/ItemScreen.dart';
import 'package:fry_guys/Screens/BasketScreen.dart';

class MealDealCard extends StatefulWidget {
  final String mealName;
  final String description;
  final String imagePath;
  final double price;

  const MealDealCard({
    Key? key,
    required this.mealName,
    required this.description,
    required this.imagePath,
    required this.price,
    required totalPrice,
  }) : super(key: key);

  @override
  _MealDealCardState createState() => _MealDealCardState();
}

class _MealDealCardState extends State<MealDealCard> {
  double _totalPrice = 0.0; // Maintain the total price within the state

  void _addToTotal(double price) {
    setState(() {
      _totalPrice += price; // Increment the total price by the meal price
    });
    _showSnackbar(context, _totalPrice);
  }

  void _showSnackbar(BuildContext context, double updatedPrice) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/icons/Basket.svg',
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'المجموع: ${updatedPrice.toStringAsFixed(2)} SR',
                  style: kMessiri_14.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasketScreen(
                        selectedItems: [
                          widget.mealName
                        ], // Include selected meal
                        totalPrice: updatedPrice,
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemScreen(
                mealName: widget.mealName,
                imagePath: widget.imagePath,
                description: widget.description,
                price: widget.price,
              ),
            ),
          );
        },
        child: Card(
          color: Colors.white,
          elevation: 10,
          shadowColor: Colors.grey.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: lightgrey),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        widget.imagePath,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Meal Name
                          Text(
                            widget.mealName,
                            style: kMessiri_16.copyWith(color: darkgrey),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 10),

                          // Description
                          Text(
                            widget.description,
                            style: kMessiri_10.copyWith(color: darkgrey),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 20),

                          // Price and Add Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.price.toStringAsFixed(2)} SR',
                                style: kMessiri_14.copyWith(color: yellow),
                              ),
                              TextButton(
                                onPressed: () {
                                  _addToTotal(
                                      widget.price); // Add price to total
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: yellow,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '+ إضافة',
                                    style: kMessiri_16.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
