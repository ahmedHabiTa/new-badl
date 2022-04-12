import 'package:badl/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBarIcons extends StatelessWidget {
  IconData icon;
  Function() onTap;

  HomeAppBarIcons({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> onTap(),
      child: Container(
        height: 29,
        width: 29,
        decoration: BoxDecoration(
          color: MyColors.meanColor2,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
