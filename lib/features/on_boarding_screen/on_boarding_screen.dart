import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:badl/features/auth/presentation/pages/phone_auth_screen.dart';
import 'package:badl/core/colors.dart';
import 'package:badl/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modals/onBoard_modals.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController? _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 30.0.w,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () async{
                        await SharedPrefsHelper.saveData(key: 'onBoard', value: true);
                        print('skip');
                        Constants.navigateToRep(
                            routeName:const PhoneAuthScreen(), context: context);
                      },
                      child: Text(
                        'تخطى',
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                SizedBox(
                  height: 600.0.h,
                  child: PageView.builder(
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: onBoardingList.length,
                    physics: BouncingScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (BuildContext? context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 15.0.w, left: 15.0.w),
                        child: Column(
                          children: [
                            Image(
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: 253.0.h,
                              image: AssetImage(onBoardingList[index].image!),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Text(
                              onBoardingList[index].title!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0.sp,
                              ),
                            ),
                            Text(
                              onBoardingList[index].description!,
                              style: TextStyle(
                                fontSize: 15.0.sp,
                                color: Color(0xFF575757),
                                height: 1.0,
                              ),
                            ),
                            SizedBox(height: 100.h,),
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    onBoardingList.length,
                                        (index) =>
                                        customDotIndicator(
                                            context: context, index: index),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (currentIndex < 2) {
                                        currentIndex = currentIndex + 1;
                                        // _controller!.nextPage(duration: Duration(milliseconds: 200), curve: Curves.ease);
                                        _controller!.animateToPage(currentIndex,
                                            duration: Duration(
                                                milliseconds: 200),
                                            curve: Curves.ease);
                                      } else {
                                        //  Navigator.pushNamed(context, loginScreen);
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 142.0.w,
                                    height: 50.0.h,
                                    decoration: BoxDecoration(
                                      color: MyColors.meanColor,
                                      borderRadius: BorderRadius.circular(
                                          14.0.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        currentIndex == 3 ? "ابداى" : 'التالى',
                                        style: TextStyle(
                                          fontSize: 15.0.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40.0.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customDotIndicator({BuildContext? context, int? index}) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 200,
      ),
      margin: EdgeInsets.only(right: 5),
      width: currentIndex == index ? 34.0.w : 18.w,
      height: 9.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color:
        currentIndex == index ? MyColors.meanColor : Color(0xFFababab),
      ),
    );
  }
}
