import 'package:badl/core/colors.dart';
import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/home__item_card.dart';
import 'package:badl/core/common_widgets/loading_widget.dart';
import 'package:badl/core/constants.dart';
import 'package:badl/features/Home/provider/ads_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common_widgets/custom_dialog.dart';
import '../../../../core/util/shared_pref_helper.dart';
import 'my_products_screen.dart';

class AdsDetailsScreen extends StatelessWidget {
  final int? id;

  const AdsDetailsScreen({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AdsProvider>(context, listen: false)
        .getAdById(id: id.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomText(
            text: 'تفاصيل الاعلان',
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
        body: Consumer<AdsProvider>(
          builder: (context, adProvider, child) {
            return adProvider.isLoading == true
                ? const Center(
                    child: LoadingWidget(),
                  )
                : SizedBox(
                    height: 700.h,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0.w, right: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: adProvider.adModel!.name,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: MyColors.meanColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CustomText(
                                  text: adProvider.adModel!.categoryName,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.meanColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 15.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.person,
                                    color: Color(0xFF575757),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomText(
                                    text: 'عمر احمد',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF575757),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFF575757),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomText(
                                    text: 'المنصوره ,مصر ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF575757),
                                  ),
                                  SizedBox(
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
                                  image:
                                      NetworkImage(adProvider.adModel!.image),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 310.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  CustomText(
                                    text: 'سنه الإنتاج :  2020',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF232323),
                                  ),
                                  CustomText(
                                    text: 'مده الاستخدام سنتين',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF232323),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: CustomText(
                                  text: 'الوصف',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2b2b2b),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 300.w,
                              child: CustomText(
                                text: adProvider.adModel!.desc,
                                fontSize: 12,
                                color: const Color(0xFF7e7e7e),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 310.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _customButtom(
                                    color: MyColors.meanColor,
                                    onTap: () => print('favourite'),
                                    icon: Icons.favorite_outline,
                                  ),
                                  _customButtom(
                                    color: MyColors.meanColor,
                                    onTap: () => print('call'),
                                    icon: Icons.add_ic_call_outlined,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 56.h,
                                      width: 158.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: MyColors.meanColor,
                                      ),
                                      child: const Center(
                                        child: CustomText(
                                          text: 'أضف عرض',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFffffff),
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      final token =
                                          await SharedPrefsHelper.getData(
                                              key: 'token');
                                      if (token == "1") {
                                        return CustomDialog.customDialog(
                                            context: context);
                                      } else {
                                        Constants.navigateTo(
                                            routeName: MyProductsScreen(
                                              adId: id.toString(),
                                              title: 'اختر منتج',
                                            ),
                                            context: context);
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // SizedBox(
                            //   width: 310.w,
                            //   child: GestureDetector(
                            //     child: Container(
                            //       height: 56.h,
                            //       width: 158.w,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Color(0xFFe92d2d),
                            //       ),
                            //       child: Center(
                            //         child: CustomText(
                            //           text: 'رفض',
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.bold,
                            //           color: const Color(0xFFffffff),
                            //         ),
                            //       ),
                            //     ),
                            //     onTap: () => print('accept'),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(right: 15.0),
                            //     child: CustomText(
                            //       text: 'إعلانات مشابهه',
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.bold,
                            //       color: const Color(0xFF2b2b2b),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                            //   child: SizedBox(
                            //     // height: 400.h,
                            //     child: GridView.builder(
                            //         shrinkWrap: true,
                            //         itemCount: 6,
                            //         physics: const NeverScrollableScrollPhysics(),
                            //         gridDelegate:
                            //         const SliverGridDelegateWithFixedCrossAxisCount(
                            //           crossAxisCount: 2,
                            //           childAspectRatio: 2 / 2.5,
                            //           crossAxisSpacing: 12,
                            //           mainAxisSpacing: 10,
                            //         ),
                            //         itemBuilder: (context, index) {
                            //           return HomeItemCard();
                            //         }),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget _customButtom({
    required IconData icon,
    required Color color,
    required Function onTap,
  }) {
    return GestureDetector(
      child: Container(
        height: 56.h,
        width: 56.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFfcfcfc),
        ),
        child: Icon(
          icon,
          color: color,
          size: 30,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
