// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWideButtom extends StatelessWidget {
  double height;
  double width;
  Color color;
  Function onTap;
  Widget child;

  CustomWideButtom({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
