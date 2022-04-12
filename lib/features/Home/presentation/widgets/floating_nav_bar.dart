
import 'package:badl/features/Home/presentation/pages/add_offer_screen.dart';
import 'package:badl/features/Home/presentation/pages/home_screen.dart';
import 'package:badl/features/Home/presentation/pages/my_products_screen.dart';
import 'package:badl/features/Home/presentation/pages/profile_screen.dart';
import 'package:badl/features/Home/presentation/pages/settings_screen.dart';
import 'package:badl/core/colors.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingNavigationBar extends StatefulWidget {
  const FloatingNavigationBar({Key? key}) : super(key: key);

  @override
  _FloatingNavigationBarState createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      width: 340.w,
      iconSize: 30,
      backgroundColor: const Color(0xFFe5e5e5),
      selectedBackgroundColor: const Color(0xFFe5e5e5),
      selectedItemColor: MyColors.meanColor,
      unselectedItemColor: const Color(0xFFa5a5a5),
      onTap: (int val) {
        switch (val) {
          case 0:
            {
              HomeScreen();
            }
            break;

          case 1:
            {
              MyProductsScreen(); //statements;
            }
            break;
          case 2:
            {
              AddOfferScreen(); //statements;
            }
            break;
          case 3:
            {
              ProfileScreen(); //statements;
            }
            break;
          case 4:
            {
              SettingsScreen(); //statements;
            }
            break;
          default:
            {
              //statements;
            }
            break;
        }

        setState(() => _index = val);
      },
      currentIndex: _index,
      items: [
        FloatingNavbarItem(icon: Icons.home_filled,),
        FloatingNavbarItem(icon: Icons.bookmarks_rounded,),
        FloatingNavbarItem(icon: Icons.add_box,),
        FloatingNavbarItem(icon: Icons.person,),
        FloatingNavbarItem(icon: Icons.message,),
      ],
    );
  }
}
