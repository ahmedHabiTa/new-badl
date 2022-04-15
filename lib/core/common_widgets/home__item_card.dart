import 'package:badl/features/Home/presentation/pages/adver_details_screen.dart';
import 'package:badl/core/colors.dart';
import 'package:badl/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class HomeItemCard extends StatefulWidget {
  final int? id;
  final String? image;
  final String? title;

 const HomeItemCard({
    Key? key,
     this.id,
   this.image,
   this.title,
  }) : super(key: key);

  @override
  State<HomeItemCard> createState() => _HomeItemCardState();
}

class _HomeItemCardState extends State<HomeItemCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Constants.navigateTo(
                routeName:  AdsDetailsScreen(id: widget.id!), context: context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image:  DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(widget.image??
                  'https://images.unsplash.com/photo-1551582045-6ec9c11d8697?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(15.r)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'خدمات',
                    fontSize: 10,
                    color: const Color(0xFF575757),
                    fontWeight: FontWeight.bold,
                  ),
                  Center(
                    child: SizedBox(
                      height: 35,
                      width: 104,
                      child: CustomText(
                        maxLines: 2,
                        text: widget.title!,
                        fontSize: 10,
                        color: const Color(0xFF575757),
                        fontWeight: FontWeight.bold,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF666666),
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        text: 'المنصوره ,مصر ',
                        fontSize: 10,
                        color: const Color(0xFF4f4f4f),
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      CustomText(
                        text: 'تم التبادل',
                        fontSize: 8,
                        color: MyColors.meanColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 5),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 85.h,
          left: 11.w,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFavourite = !isFavourite;
              });
            },
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                Icons.favorite_outlined,
                color: isFavourite ? Colors.red : Color(0xFFababab),
              ),
            ),
          ),
        )
      ],
    );
  }
}
