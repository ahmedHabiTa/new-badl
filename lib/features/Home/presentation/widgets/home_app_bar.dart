import 'package:badl/core/colors.dart';
import 'package:badl/core/providers/country_provider.dart';
import 'package:badl/features/Home/presentation/pages/search_screen.dart';
import 'package:badl/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:badl/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'home_app_bar_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 150.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: MyColors.meanColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        // Image.asset(
        //   'assets/home_bar.png',
        //   fit: BoxFit.fill,
        //   width: double.infinity,
        // ),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 50.h,
              width: 150.w,
              child: SvgPicture.asset('assets/white-logo.svg'),
            ),
            // HomeAppBarIcons(
            //   icon: Icons.favorite,
            //   onTap: () => Constants.navigateTo(
            //       routeName: const FavouriteScreen(), context: context),
            // ),
            const Spacer(),
            //ToDo:اغير ايقونه السيرش باللي ف التصميم
            HomeAppBarIcons(
              icon: Icons.search,
              onTap: () async{
                await Provider.of<CountryProvider>(context,listen: false).getCountry();
                Constants.navigateTo(
                  routeName: const SearchScreen(), context: context);
              },
            ),
            const SizedBox(
              width: 10,
            ),
            HomeAppBarIcons(
              icon: Icons.notifications,
              onTap: () => Constants.navigateTo(
                  routeName: const NotificationsScreen(), context: context),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        // Positioned(
        //   bottom: 20,
        //   right: 28,
        //   child: Row(
        //     children: [
        //       const Icon(
        //         Icons.location_on,
        //         color: Colors.white,
        //       ),
        //       const SizedBox(
        //         width: 10,
        //       ),
        //       DropdownButtonHideUnderline(
        //         child: DropdownButton<String>(
        //           iconEnabledColor: Colors.white,
        //           value: 'مصر',
        //           style: const TextStyle(color: Colors.white),
        //           items: <String>['مصر', 'تونس', 'لبنان'].map((String value) {
        //             return DropdownMenuItem<String>(
        //               value: value,
        //               child: Text(
        //                 value,
        //                 style: const TextStyle(color: Colors.white),
        //               ),
        //             );
        //           }).toList(),
        //           onChanged: (_) {},
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
