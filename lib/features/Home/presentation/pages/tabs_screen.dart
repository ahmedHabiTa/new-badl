
import 'package:badl/features/Home/presentation/pages/profile_screen.dart';
import 'package:badl/features/Home/presentation/pages/settings_screen.dart';
import 'package:badl/core/colors.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_offer_screen.dart';
import 'home_screen.dart';
import 'my_products_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _index = 0;
  List<Map<String, dynamic>> pages = [
    {"index": 0, "page": const HomeScreen()},
    {"index": 1, "page": const MyProductsScreen()},
    {"index": 2, "page": const AddOfferScreen()},
    {"index": 3, "page": const ProfileScreen()},
    {"index": 4, "page": const SettingsScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingNavbar(
        width: 340.w,
        iconSize: 30,
        backgroundColor: const Color(0xFFe5e5e5),
        selectedBackgroundColor: const Color(0xFFe5e5e5),
        selectedItemColor: MyColors.meanColor,
        unselectedItemColor: const Color(0xFFa5a5a5),
        onTap: (int val) {
          setState(() => _index = val,);
        },
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.home_filled,),
          FloatingNavbarItem(icon: Icons.bookmarks_rounded,),
          FloatingNavbarItem(icon: Icons.add_box,),
          FloatingNavbarItem(icon: Icons.person,),
          FloatingNavbarItem(icon: Icons.message,),
        ],
      ),
      body: pages[_index]['page'],
    );
  }
}
