import 'dart:async';

import 'package:badl/features/auth/presentation/pages/register_screen.dart';
import 'package:badl/core/colors.dart';
import 'package:badl/core/constants.dart';
import 'package:badl/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class PincodeScreen extends StatefulWidget {
  final String phoneNumber;
  final String countryID;

  const PincodeScreen({
    Key? key,
    required this.phoneNumber,
    required this.countryID,
  }) : super(key: key);

  @override
  _PincodeScreenState createState() => _PincodeScreenState();
}

class _PincodeScreenState extends State<PincodeScreen> {
  TextEditingController pinCodeController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Timer? _timer;
  int _start = 60;
  bool timerVisibility = true;

  void startTimer() {
    _start = 60;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timerVisibility = true;
            timer.cancel();
          });
        } else {
          setState(() {
            timerVisibility = false;
            _start--;
          });
        }
      },
    );
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return Container(
            height: 600.h,
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 30.0.w,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'كود التفعيل',
                        style: TextStyle(
                          fontSize: 18.0.sp,
                          color: const Color(0xFF2b2b2b),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: const TextStyle(
                            color: MyColors.meanColor,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: true,
                          obscuringCharacter: '*',
                          obscuringWidget: const Icon(
                            Icons.done,
                            size: 24,
                          ),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 3) {
                              return "";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            inactiveFillColor: Colors.grey.withOpacity(0.4),
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                            activeColor: MyColors.meanColor,
                            inactiveColor:
                                const Color(0xFFf5f5f5).withOpacity(0.1),
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: pinCodeController,
                          keyboardType: TextInputType.number,
                          onCompleted: (v) {},
                          onChanged: (value) {
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      hasError ? 'من فضلك ادخل الكود' : "",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText.length != 6) {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                        Constants.showToast(
                          message: 'كود تحقق خطأ',
                          color: Colors.red,
                        );
                      } else {
                        await authProvider.verify(
                            smsCode: pinCodeController.text.toString(),
                            context: context,
                            login: () async {
                              await authProvider.login(
                                mobile: widget.phoneNumber,
                                countryID: widget.countryID,
                                context: context,
                              );
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
                          'تحقق',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لم تستلم رسالة ؟',
                        style: TextStyle(
                            color: Color(0xFF666666), fontSize: 14.sp),
                      ),
                      timerVisibility == true
                          ? TextButton(
                              onPressed: () async {
                                snackBar('تم اعاده الارسال');
                                await authProvider.getOtpNumber(
                                    phoneNumber: widget.phoneNumber);
                                startTimer();
                              },
                              child: Text(
                                'إعادة الارسال بعد',
                                style: TextStyle(
                                    color: MyColors.meanColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(
                                '(00:$_start)',
                                style: TextStyle(
                                  color: MyColors.meanColor,
                                ),
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
