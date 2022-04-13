import 'package:badl/core/colors.dart';
import 'package:badl/core/common_widgets/custom_drop_down_form_field.dart';
import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/custom_text_form_field.dart';
import 'package:badl/core/common_widgets/custom_wide_buttom.dart';
import 'package:badl/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'continue_add_offer.dart';

class AddOfferScreen extends StatelessWidget {
  const AddOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: 'اضافه منتج',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2b2b2b),
        ),
        // leading: GestureDetector(
        //   onTap: () => Navigator.pop(context),
        //   child: const Icon(
        //     Icons.arrow_back_ios_rounded,
        //     color: Color(0xFF1a0405),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                CustomFormField(
                  width: 320.w,
                  height: 55.h,
                  hintText: 'اسم الاعلان',
                  backgroundColor: const Color(0xFFf3f3f3),
                ),
                const SizedBox(height: 15),
                CustomDropDownFormField(
                  title: 'نوع المنتج',
                  items: [
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Text(
                            'test',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      value: '1',
                    )
                  ],
                ),
                const SizedBox(height: 15),
                CustomDropDownFormField(
                  title: 'القسم',
                  items: [
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Text(
                            'test',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      value: '1',
                    )
                  ],
                ),
                const SizedBox(height: 15),
                CustomDropDownFormField(
                  title: 'سنه الانتاج',
                  items: [
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Text(
                            'test',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      value: '1',
                    )
                  ],
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    print('choose photo');
                  },
                  child: Container(
                    width: 320.w,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xFFe5e5e5)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.cloud_upload,
                            color: MyColors.meanColor,
                            size: 80,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: 'يمكنك تحميل الصور ',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF707070),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                CustomWideButtom(
                  height: 56.h,
                  width: 320.w,
                  color: MyColors.meanColor,
                  onTap: () {
                    Constants.navigateTo(
                        routeName: ContinueAddOfferScreen(), context: context);
                  },
                  child: Center(
                    child: CustomText(
                      text: 'التالي',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFffffff),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
