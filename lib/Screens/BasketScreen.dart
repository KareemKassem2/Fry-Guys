import 'package:flutter/material.dart';
import '../Constants/Fonts.dart';
import '../Constants/Colors.dart';

class BasketScreen extends StatelessWidget {
  final List<String> selectedItems;
  final double totalPrice;

  const BasketScreen({
    Key? key,
    required this.selectedItems,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('سلة المشتريات',
            style: kMessiri_16.copyWith(color: Colors.white)),
        backgroundColor: yellow,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(
                        selectedItems[index],
                        style: kMessiri_14.copyWith(color: darkgrey),
                      ),
                      trailing: Text(
                        '14 SR', // Assuming each item has a fixed price; you can adjust as needed
                        style: kMessiri_14.copyWith(color: darkgrey),
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'المجموع',
                  style: kMessiri_16.copyWith(color: darkgrey),
                ),
                Text(
                  'SR $totalPrice',
                  style: kMessiri_16.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: yellow),
                onPressed: () {
                  // Handle checkout action
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 90),
                  child: Text(
                    'إتمام الشراء',
                    style: kMessiri_20.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
