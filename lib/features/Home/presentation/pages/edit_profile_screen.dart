import 'package:badl/core/colors.dart';
import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/custom_text_form_field.dart';
import 'package:badl/core/common_widgets/custom_wide_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

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
            text: 'تعديل الملف الشخصي',
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
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 800.h,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight * 0.8,
                    child: CustomText(
                      text: 'اسم المستخدم',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4a4a4a),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    height: 60.h,
                    hintText: 'الاسم',
                    initialValue: 'ايلينا احمد هلال',
                    prefix: Icon(
                      Icons.person,
                      color: Color(0xFF4a4a4a),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight * 0.8,
                    child: CustomText(
                      text: 'الهاتف المحمول',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4a4a4a),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomFormField(
                        hintText: 'الهاتف المحمول',
                        width: 253.w,
                        height: 60.h,
                        prefix: Icon(
                          Icons.add_ic_call_outlined,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60.h,
                        width: 66.w,
                        decoration: BoxDecoration(
                          color: MyColors.fieldContainerColors,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 14.h,
                                width: 18.w,
                                child: Image.asset(
                                  'assets/egypt.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '20+',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight * 0.8,
                    child: CustomText(
                      text: 'الصوره الشخصيه',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4a4a4a),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      print('choose photo');
                    },
                    child: Container(
                      width: 320.w,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xFFe5e5e5)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cloud_upload,
                              color: MyColors.meanColor,
                              size: 80,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: 'يمكنك تحميل الصور ',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF707070),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomWideButtom(
                    height: 56.h,
                    width: 328.w,
                    color: MyColors.meanColor,
                    onTap: () {},
                    child: Center(
                      child: CustomText(
                        text: 'حفظ التعديلات',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFffffff),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
