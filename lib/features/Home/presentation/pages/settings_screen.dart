import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/constants.dart';
import 'package:badl/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'content_screen.dart';
import 'edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: 'تطبيق بدل',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2b2b2b),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: 600.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              _customSettingItem(
                onTap: () {
                  Constants.navigateTo(
                      routeName: EditProfileScreen(), context: context);
                },
                title: 'تعديل الملف الشخصي',
                icon: const Icon(
                  Icons.person,
                  size: 19,
                  color: Color(0xFF575757),
                ),
              ),
              _customSettingItem(
                onTap: () {},
                title: 'اللغه',
              ),
              _customSettingItem(
                onTap: () {
                  Constants.navigateTo(
                      routeName: const ContentScreen(
                        title: 'تفاصيل التبادل',
                        content:
                            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد ',
                      ),
                      context: context);
                },
                title: 'تفاصيل التبادل',
              ),
              _customSettingItem(
                onTap: () {
                  Constants.navigateTo(
                      routeName: const ContentScreen(
                        title: 'من نحن',
                        content:
                            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد ',
                      ),
                      context: context);
                },
                title: 'من نحن',
              ),
              _customSettingItem(
                onTap: () {
                  Constants.navigateTo(
                      routeName: const ContentScreen(
                        title: 'الشروط والاحكام',
                        content:
                            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد ',
                      ),
                      context: context);
                },
                title: 'الشروط والاحكام',
              ),
              _customSettingItem(
                onTap: () {
                  Constants.navigateTo(
                      routeName: const ContentScreen(
                        title: 'الشكاوي والمقترحات',
                        content:
                            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد ',
                      ),
                      context: context);
                },
                title: 'الشكاوي والمقترحات',
              ),
              _customSettingItem(
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false).logout(
                    context: context,
                  );
                },
                title: 'تسجيل الخروج',
                isLogout: true,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _customSettingItem({
    required Function onTap,
    required String title,
    Icon? icon,
    bool isLogout = false,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 51.h,
          width: 300.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: const Color(0xFFf6f6f6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon ?? Container(),
              CustomText(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF575757),
              ),
              Icon(
                isLogout ? Icons.login : Icons.arrow_forward_ios,
                size: 19,
                color: Color(0xFF575757),
              )
            ],
          ),
        ),
      ),
    );
  }
}
