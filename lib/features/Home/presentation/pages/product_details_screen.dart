import 'package:badl/core/colors.dart';
import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_offer_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomText(
            text: 'تفاصيل المنتج',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2b2b2b),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xFF1a0405),
            ),
          ),
        ),
        body: SizedBox(
          height: 700.h,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 12.0.w, right: 12.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      CustomText(
                        text: 'شاحن سياره وشاحن متنقل',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColors.meanColor,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Constants.navigateTo(routeName: AddOfferScreen(),
                              context: context);
                        },
                        child: Icon(
                          Icons.edit,
                          color: MyColors.meanColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        text: 'تعديل',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: MyColors.meanColor,
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      children: [
                        CustomText(
                          text: 'خدمه',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: MyColors.meanColor,
                        ),
                        const SizedBox(width: 20),
                        CustomText(
                          text: 'القسم',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: MyColors.meanColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0xFF575757),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          text: 'عمر احمد',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF575757),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.location_on,
                          color: Color(0xFF575757),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          text: 'المنصوره ,مصر ',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF575757),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 310.w,
                    height: 189.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1551582045-6ec9c11d8697?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 310.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'سنه الإنتاج :  2020',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF232323),
                        ),
                        CustomText(
                          text: 'مده الاستخدام سنتين',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF232323),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: CustomText(
                        text: 'الوصف',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2b2b2b),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300.w,
                    child: CustomText(
                      text:
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد ',
                      fontSize: 12,
                      color: const Color(0xFF7e7e7e),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
