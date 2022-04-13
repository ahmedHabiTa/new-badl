import 'package:badl/core/common_widgets/custom_text_form_field.dart';
import 'package:badl/features/Home/presentation/pages/tabs_screen.dart';
import 'package:badl/core/colors.dart';
import 'package:badl/core/constants.dart';
import 'package:badl/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final String mobile;
  final String countryID;

  RegisterScreen({
    Key? key,
    required this.mobile,
    required this.countryID,
  }) : super(key: key);

  final nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SizedBox(
          height: 800.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 30.0.w,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        Text(
                          'حساب جديد',
                          style: TextStyle(
                            fontSize: 18.0.sp,
                            color: const Color(0xFF2b2b2b),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 25.h,
                          width: 25.w,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/wave.png'))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 60.0.w),
                  child: Text(
                    'هذا النص مثال لنص يمكن أن يستبدل في نفس المساحة قد تم توليد هذا النص من مولد النص العربى، حيث ',
                    style: TextStyle(
                        fontSize: 14.sp,
                        letterSpacing: 4,
                        color: const Color(0xFF575757)),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomFormField(
                  hintText: 'اسم المستخدم',
                  controller: nameController,
                  validation: 'هذا الحقل مطلوب',
                  height: 60.h,
                  width: 328.w,
                  prefix: Icon(
                    Icons.person,
                    color: Color(0xFF4a4a4a),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30.w),
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'الصوره الشخصيه',
                      style: TextStyle(
                        color: Color(0xFF4a4a4a),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                //ToDo: اعمل كونتينر نفس الحجم ولما يختار صوره اغير بينهم
                Container(
                  height: 168,
                  width: 328.w,
                  decoration: BoxDecoration(
                      color: const Color(0xFFe5e5e5),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: const Center(
                    child: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 37,
                      color: Color(0xFF4a4a4a),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Consumer<AuthProvider>(
                  builder: (context, authProvider, _) {
                    return GestureDetector(
                      onTap: () async {
                        if (!formKey.currentState!.validate()) {
                        } else {
                          await authProvider.register(
                            mobile: mobile,
                            name: nameController.text.toString(),
                              countryID: countryID,
                            context: context
                          ).then((value){
                            Constants.navigateToRep(
                                routeName: const TabsScreen(), context: context);
                          });

                        }

                      },
                      child: Container(
                        height: 56.h,
                        width: 328.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: MyColors.meanColor,
                        ),
                        child: Center(
                          child: Text(
                            'حساب جديد',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
