import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/features/Home/presentation/pages/adver_details_screen.dart';
import 'package:badl/core/colors.dart';
import 'package:badl/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({Key? key}) : super(key: key);

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
          text: 'التنبيهات',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            CustomText(
              text: 'تم استلام عرض جديد لمنتجك',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: MyColors.meanColor,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomText(
                text:
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضا',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF575757),
              ),
            ),
            GestureDetector(
              onTap: () {
                Constants.navigateTo(
                    routeName: AdsDetailsScreen(id: 1), context: context);
              },
              child: Container(
                height: 60.h,
                width: 328.w,
                decoration: BoxDecoration(
                  color: MyColors.meanColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: CustomText(
                    text: 'عرض تفاصيل العرض',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
