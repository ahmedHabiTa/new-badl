import 'package:badl/core/colors.dart';
import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowText extends StatelessWidget {
  String rightText;
  String leftText;
  Function onTap;

   CustomRowText({
    Key? key,
    required this.rightText,
    required this.leftText,
     required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0, left: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText(
            text: rightText,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2b2b2b),
          ),
          const Spacer(),
          // GestureDetector(
          //   onTap: ()=>onTap(),
          //   child: Row(
          //     children: [
          //       const Icon(
          //         Icons.filter_alt_sharp,
          //         size: 20,
          //         color: MyColors.meanColor,
          //       ),
          //       CustomText(
          //         text: leftText,
          //         fontSize: 12,
          //         fontWeight: FontWeight.bold,
          //         color: MyColors.meanColor,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
