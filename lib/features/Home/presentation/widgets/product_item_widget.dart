import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/features/Home/presentation/pages/product_details_screen.dart';
import 'package:badl/core/colors.dart';
import 'package:badl/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatelessWidget {
  final String? title;
  final String? categoryName;
  final String? image;

  const ProductItemWidget({
    Key? key,
    this.title,
    this.categoryName,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: 322.w,
        height: 105.h,
        child: Row(
          children: [
            Container(
              height: 105.h,
              width: 75.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(image??
                          'https://images.unsplash.com/photo-1551582045-6ec9c11d8697?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'))),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 230.w,
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      CustomText(
                        text:title ?? 'شاحن سياره متنقل وشاحن متنقل',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4a4a4a),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            barrierLabel: "Barrier",
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.5),
                            transitionDuration: Duration(milliseconds: 700),
                            pageBuilder: (_, __, ___) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  height: 167,
                                  width: 294,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 65,
                                          width: 65,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage('assets/sad.png'),
                                          )),
                                        ),
                                        const SizedBox(height: 10),
                                        CustomText(
                                          text: 'تم مسح عرضك',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF2b2b2b),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            transitionBuilder: (_, anim, __, child) {
                              Tween<Offset> tween;
                              if (anim.status == AnimationStatus.reverse) {
                                tween = Tween(
                                    begin: Offset(-1, 0), end: Offset.zero);
                              } else {
                                tween = Tween(
                                    begin: Offset(1, 0), end: Offset.zero);
                              }

                              return SlideTransition(
                                position: tween.animate(anim),
                                child: FadeTransition(
                                  opacity: anim,
                                  child: child,
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.delete_outlined,
                          color: MyColors.meanColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomText(
                          text: 'خدمات',
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF636363),
                        ),
                        const SizedBox(width: 25),
                        CustomText(
                          text:categoryName ?? 'القسم',
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF636363),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Constants.navigateTo(
                              routeName: ProductDetailsScreen(),
                              context: context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: 'عرض المزيد',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: MyColors.meanColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomText(
                        text: 'تم التبادل',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: MyColors.meanColor,
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
