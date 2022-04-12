import 'package:badl/core/common_widgets/custom_text_form_field.dart';
import 'package:badl/features/auth/presentation/pages/pincode_screen.dart';
import 'package:badl/core/colors.dart';
import 'package:badl/core/constants.dart';
import 'package:badl/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context,listen: false).getCountry();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            return Container(
              height: 800.h,
              padding: const EdgeInsets.all(10.0),
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
                              'تسجيل الدخول',
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
                      height: 10.h,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomFormField(
                          controller: phoneController,
                          hintText: 'الهاتف المحمول',
                          onChanged: (value){
                            setState(() {
                              value = phoneController.text.toString();
                            });
                            print(phoneController.text);
                          },
                          validation: 'من فضلك ادخل هاتفك',
                          width: 253.w,
                          height: 70.h,
                          prefix: const Icon(
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
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (!formKey.currentState!.validate()) {
                          print('un authorized');
                        } else {
                          await authProvider
                              .getOtpNumber(
                                  phoneNumber: phoneController.text.toString())
                              .then((value) {
                            Constants.navigateTo(
                              routeName:  PincodeScreen(phoneNumber : phoneController.text.toString()),
                              context: context,
                            );
                          });
                        }
                      },
                      child: authProvider.isLoading == true
                          ? const CircularProgressIndicator(
                              color: MyColors.meanColor,
                            )
                          : Container(
                              height: 56.h,
                              width: 328.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: MyColors.meanColor,
                              ),
                              child: Center(
                                child: Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
