import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/features/Home/presentation/pages/add_product_screen.dart';
import 'package:badl/features/Home/presentation/widgets/product_item_widget.dart';
import 'package:badl/features/Home/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/colors.dart';
import '../../../../core/common_widgets/loading_widget.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/shared_pref_helper.dart';

class MyProductsScreen extends StatelessWidget {
  final String? adId;
  final String? title;

  const MyProductsScreen({
    Key? key,
    this.adId,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final token = SharedPrefsHelper.getData(key: 'token');
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: title ?? 'منتجاتي',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2b2b2b),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 700.h,
          width: double.infinity,
          child: token == "1"
              ? const Center(
                  child: CustomText(
                    text: 'غير مصرح لك من فضلك سجل الدخول اولا',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              : Consumer<UserProvider>(
                  builder: (context, userProvider, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        userProvider.isLoading == true
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.only(right: 17.0),
                                child: CustomText(
                                  text: userProvider.adDetailsList!.length
                                          .toString() +
                                      " منتج",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2b2b2b),
                                ),
                              ),
                        const SizedBox(height: 15),
                        userProvider.isLoading == true
                            ? const Center(
                                child: LoadingWidget(),
                              )
                            : userProvider.adDetailsList!.isEmpty
                                ? Container()
                                : Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15.0, left: 15.0),
                                      child: SizedBox(
                                        height: 600.h,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 480.h,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: userProvider
                                                    .adDetailsList!.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      showGeneralDialog(
                                                        context: context,
                                                        barrierLabel: "Barrier",
                                                        barrierDismissible:
                                                            true,
                                                        barrierColor: Colors
                                                            .black
                                                            .withOpacity(0.5),
                                                        transitionDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    700),
                                                        pageBuilder:
                                                            (_, __, ___) {
                                                          return Dialog(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            child: Container(
                                                              height: 167,
                                                              width: 294,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.r),
                                                              ),
                                                              child: Center(
                                                                child: SizedBox(
                                                                  height: 150.h,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      CustomText(
                                                                        text:
                                                                            'هل انت متأكد من تبادل العرض ؟',
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: const Color(
                                                                            0xFF2b2b2b),
                                                                      ),
                                                                      const Spacer(),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              if (adId == null) {
                                                                                Constants.showToast(message: 'من فضلك اختر عرض اولا للتبادل', color: Colors.red);
                                                                              } else {
                                                                                await userProvider.postAdOffer(context: context, adId: adId!, offerAdId: userProvider.adDetailsList![index].id.toString());
                                                                              }
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                const CustomText(
                                                                              text: 'نعم',
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xFF2b2b2b),
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                const CustomText(
                                                                              text: 'الغاء',
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xFF2b2b2b),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        transitionBuilder: (_,
                                                            anim, __, child) {
                                                          Tween<Offset> tween;
                                                          if (anim.status ==
                                                              AnimationStatus
                                                                  .reverse) {
                                                            tween = Tween(
                                                                begin: Offset(
                                                                    -1, 0),
                                                                end: Offset
                                                                    .zero);
                                                          } else {
                                                            tween = Tween(
                                                                begin: Offset(
                                                                    1, 0),
                                                                end: Offset
                                                                    .zero);
                                                          }

                                                          return SlideTransition(
                                                            position: tween
                                                                .animate(anim),
                                                            child:
                                                                FadeTransition(
                                                              opacity: anim,
                                                              child: child,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: ProductItemWidget(
                                                      title: userProvider
                                                          .adDetailsList![index]
                                                          .name,
                                                      categoryName: userProvider
                                                          .adDetailsList![index]
                                                          .categoryName,
                                                      image: userProvider
                                                          .adDetailsList![index]
                                                          .image,
                                                      type: userProvider
                                                          .adDetailsList![index]
                                                          .type,


                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            GestureDetector(
                                              child: Container(
                                                height: 56.h,
                                                width: 328.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: MyColors.meanColor,
                                                ),
                                                child: const Center(
                                                  child: CustomText(
                                                    text: 'اضف عرض جديد',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFFffffff),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Constants.navigateTo(
                                                    routeName:
                                                        const AddOfferScreen(),
                                                    context: context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                      ],
                    );
                  },
                ),
        ),
      ),
    ));
  }
}
