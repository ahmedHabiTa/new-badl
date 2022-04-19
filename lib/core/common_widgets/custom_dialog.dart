import 'package:badl/core/constants.dart';
import 'package:badl/features/auth/presentation/pages/phone_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomDialog {
 static customDialog({
    required BuildContext context,
  }) {
    return showGeneralDialog(
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
              child: SizedBox(
                height: 150.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: 'يجب عليك تسجيل الدخول اولا',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2b2b2b),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Constants.navigateToRep(
                                routeName: const PhoneAuthScreen(),
                                context: context);
                          },
                          child: const CustomText(
                            text: 'الذهاب للتسجيل',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2b2b2b),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CustomText(
                            text: 'تخطي',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2b2b2b),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin:const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin:const Offset(1, 0), end: Offset.zero);
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
  }
}
