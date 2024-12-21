import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Constants/Fonts.dart';
import '../Constants/Colors.dart';

class SideMenu extends StatelessWidget {
  final String branchTitle;
  final bool isOpen;

  const SideMenu({
    Key? key,
    required this.branchTitle,
    required this.isOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of menu items and their corresponding icons
    final List<Map<String, String>> menuItems = [
      {"title": "طلباتي", "icon": "assets/icons/Document.svg"},
      {"title": "ملفي الشخصي", "icon": "assets/icons/Profile.svg"},
      {"title": "عناوين التوصيل", "icon": "assets/icons/Location.svg"},
      {"title": "طرق الدفع", "icon": "assets/icons/Wallet.svg"},
      {"title": "اتصل بنا", "icon": "assets/icons/Message.svg"},
      {"title": "الإعدادات", "icon": "assets/icons/Setting.svg"},
      {"title": "المساعدة والأسئلة الشائعة", "icon": "assets/icons/Helps.svg"},
    ];

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white, // Ensure a clean white background
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/3d-render-avatar-character_23-2150611728.jpg'),
                    radius: 30,
                  ),
                  const SizedBox(height: 10),
                  userName(),
                  email(),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    leading: SvgPicture.asset(
                      item["icon"]!,
                      width: 24,
                      height: 24,
                      color: darkgrey,
                    ),
                    title: Text(item["title"]!, style: kMessiri_16),
                    onTap: () {
                      // Add navigation logic here
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: yellow,
                    minimumSize: Size(150, 48),
                  ),
                  onPressed: () {
                    // Logout logic
                  },
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min, // Use min to shrink-wrap the content
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/LogOut.svg", // Replace with an appropriate logout icon
                        width: 35,
                        height: 27,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'تسجيل الخروج',
                        style: kMessiri_16.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text userName() {
    return Text(
      'Kareem',
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    );
  }

  Text email() {
    return Text(
      'kareemkassem@gmail.com',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    );
  }
}
