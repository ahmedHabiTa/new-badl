import 'package:badl/core/colors.dart';
import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/custom_text_form_field.dart';
import 'package:badl/core/common_widgets/custom_wide_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueAddOfferScreen extends StatelessWidget {
  const ContinueAddOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomText(
            text: 'تابع اضافه منتج',
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
          height: 800.h,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomFormField(
                  width: 320.w,
                  height: 50.h,
                  hintText: 'رقم الهاتف',
                  backgroundColor: const Color(0xFFf3f3f3),
                ),
                const SizedBox(height: 15),
                CustomFormField(
                  width: 320.w,
                  height: 50.h,
                  hintText: 'المدينه',
                  backgroundColor: const Color(0xFFf3f3f3),
                ),
                const SizedBox(height: 15),
                CustomFormField(
                  width: 320.w,
                  height: 50.h,
                  hintText: 'مده الاستخدام',
                  backgroundColor: const Color(0xFFf3f3f3),
                ),
                const SizedBox(height: 15),
                CustomFormField(
                  width: 320.w,
                  height: 120.h,
                  hintText: 'وصف المنتج',
                  backgroundColor: const Color(0xFFf3f3f3),
                  maxLine: 10,
                ),
                const SizedBox(height: 15),
                CustomWideButtom(
                  height: 56.h,
                  width: 320.w,
                  color: MyColors.meanColor,
                  onTap: () {
                    //print('نشر');
                    showGeneralDialog(
                      context: context,
                      barrierLabel: "Barrier",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 700),
                      pageBuilder: (_, __, ___) {
                        return Dialog(backgroundColor: Colors.transparent,
                          child: Container(
                            height: 167,
                            width: 294,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
                        } else {
                          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
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
                  child: Center(
                    child: CustomText(
                      text: 'نشر',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
