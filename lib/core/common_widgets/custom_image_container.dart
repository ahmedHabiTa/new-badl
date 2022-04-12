import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImageContainer extends StatelessWidget {
  double height;
  double width;
  double radius;
  String imageUrl;

  CustomImageContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.radius,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(imageUrl)),
      ),
    );
  }
}
