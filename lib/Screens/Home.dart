import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fry_guys/Components/MealDealCard.dart';
import 'package:fry_guys/Components/SearchingCard.dart';
import 'package:fry_guys/Screens/MapScreen.dart';
import 'package:fry_guys/Components/SectionListView.dart';
import '../Constants/Fonts.dart';
import '../Constants/Colors.dart';
import '../Screens/SideMenu.dart';

class Home extends StatefulWidget {
  final String branchTitle;
  final bool isOpen;

  const Home({super.key, required this.branchTitle, required this.isOpen});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, String>> sectionItems = [
    {"title": "وجبات", "image": "assets/ساندويتش جمبري 1.png"},
    {"title": "مشروبات", "image": "assets/ساندويتش جمبري 1.png"},
    {"title": "حلويات", "image": "assets/ساندويتش جمبري 1.png"},
    {"title": "مقبلات", "image": "assets/مقبلات.png"},
  ];

  final List<Map<String, dynamic>> mealDeals = [
    {
      "mealName": "سبايسي برجر وجبة",
      "imagePath": "assets/كلاسيك برجر وجبه 1 (1).png",
      "description": "سبايسي برجر + بطاطس + صوص",
      "price": 25.0,
    },
    {
      "mealName": "برجر كلاسيك وجبة",
      "imagePath": "assets/كلاسيك برجر وجبه 1 (1).png",
      "description": "برجر كلاسيك + بطاطس + مشروب",
      "price": 30.0,
    },
    {
      "mealName": "برجر تشيكن وجبة",
      "imagePath": "assets/كلاسيك برجر وجبه 1 (1).png",
      "description": "برجر تشيكن + بطاطس + صوص",
      "price": 20.0,
    },
    {
      "mealName": "برجر لحم وجبة",
      "imagePath": "assets/كلاسيك برجر وجبه 1 (1).png",
      "description": "برجر لحم + بطاطس + صوص",
      "price": 25.0,
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: SideMenu(
        branchTitle: widget.branchTitle,
        isOpen: widget.isOpen,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Side Menu Button
                    SizedBox(
                      height: 38,
                      width: 38,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 8,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/Menu.svg',
                          width: 18,
                          height: 18,
                          color: brown,
                        ),
                      ),
                    ),
                    // Branch Information
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MapScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Down.svg',
                                width: 10,
                                height: 10,
                                color: yellow,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                widget.branchTitle,
                                style: kMessiri_14.copyWith(color: yellow),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          widget.isOpen ? 'مفتوح الأن' : 'مغلق',
                          style: kMessiri_10.copyWith(
                            color: widget.isOpen ? green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    // User Avatar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        'assets/3d-render-avatar-character_23-2150611728.jpg',
                        width: 38,
                        height: 38,
                      ),
                    ),
                  ],
                ),
              ),

              // Search Card
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 8,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/Edit.svg',
                          width: 20,
                          height: 20,
                          color: brown,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SearchingCard(controller: _controller),
                    ),
                  ],
                ),
              ),

              // Random Image
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'assets/458450899_18020822150581411_2005711142619793144_n 1.png',
                  ),
                ),
              ),

              // Sections
              SectionListView(sectionItems: sectionItems),

              // Meal Deals Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'الوجبات',
                    style: kMessiri_20.copyWith(color: darkgrey),
                  ),
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mealDeals.length,
                itemBuilder: (context, index) {
                  final meal = mealDeals[index];
                  return MealDealCard(
                    mealName: meal["mealName"],
                    imagePath: meal["imagePath"],
                    description: meal["description"],
                    price: meal["price"],
                    totalPrice: meal["price"],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
