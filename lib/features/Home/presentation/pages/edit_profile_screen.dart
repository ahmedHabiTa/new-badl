import 'package:badl/core/colors.dart';
import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/custom_text_form_field.dart';
import 'package:badl/core/common_widgets/custom_wide_buttom.dart';
import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common_widgets/custom_drop_down_form_field.dart';
import '../../../../core/common_widgets/loading_widget.dart';
import '../../../../core/providers/country_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  String? countryCode;
  String? countryID;
  @override
  Widget build(BuildContext context) {
    final username = SharedPrefsHelper.getData(key: 'username');
    final countryId = SharedPrefsHelper.getData(key: 'userCountryID');
    final mobile = SharedPrefsHelper.getData(key: 'userMobile');
    final image = SharedPrefsHelper.getData(key: 'image');
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
                    initialValue: username,
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
                        initialValue: mobile,
                        width: 253.w,
                        height: 70.h,
                        prefix: Icon(
                          Icons.add_ic_call_outlined,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Consumer<CountryProvider>(
                        builder: (context, countryProvider, _) {
                          return countryProvider.isLoading == true
                              ? const LoadingWidget()
                              : Container(
                            height: 70.h,
                            width: 66.w,
                            decoration: BoxDecoration(
                              color: MyColors.fieldContainerColors,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: CustomDropDownFormField(
                                onChanged: (value) {
                                  setState(() {
                                    countryCode = value;
                                  });
                                  print(countryCode);
                                },
                                title: 'الدوله',
                                items: countryProvider.countryList!.map(
                                      (e) {
                                    return DropdownMenuItem<String>(
                                      onTap: (){
                                        setState(() {
                                          countryID = e.id.toString();
                                        });
                                        print(countryID);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            e.title,
                                            style: TextStyle(
                                                fontSize: 12.sp),
                                          ),
                                          Text(
                                            e.code,
                                            style: TextStyle(
                                                fontSize: 12.sp),
                                          ),
                                        ],
                                      ),
                                      value: e.code.toString(),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          );
                        },
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
