import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/features/notifications/presentation/pages/notifications_details_screen.dart';
import 'package:badl/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItemCard extends StatelessWidget {
  const NotificationItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Constants.navigateTo(
            routeName: NotificationDetailsScreen(), context: context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
        child: Container(
          height: 100.h,
          color: const Color(0xFFfcfcfc),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/bell.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        CustomText(
                          text: 'حسابك الشخصى',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF292d32),
                        ),
                        const SizedBox(width: 15),
                        SizedBox(
                          width: 149.w,
                          child: CustomText(
                            text: '''
      هذا النص هو مثال لنص يمكن أن نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
                    إذا كنت تحتاج إلى عدد أكبر من الفقرات''',
                            fontSize: 12,
                            color: Color(0xFF292d32),
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SizedBox(
                        width: 200.w,
                        child: CustomText(
                          maxLines: 1,
                          text: '''
      هذا النص هو مثال لنص يمكن أن نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
                      إذا كنت تحتاج إلى عدد أكبر من الفقرات''',
                          fontSize: 12,
                          color: Color(0xFF292d32),
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      textDirection: TextDirection.ltr,
                      text: '3 : 00 am',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF575757),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
