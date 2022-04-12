import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/features/Home/presentation/widgets/product_item_widget.dart';
import 'package:badl/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: 'الحساب الشخصي',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2b2b2b),
        ),
      ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 800.h,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          height: 83.h,
                          width: 83.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1551582045-6ec9c11d8697?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'))),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                               const Icon(Icons.person,color: MyColors.meanColor,size: 18,),
                                const SizedBox(width: 10),
                                CustomText(
                                  text: 'ايلينا علاءء احمد',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF4a4a4a),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.add_call,color: MyColors.meanColor,size: 18,),
                                const SizedBox(width: 10),
                                CustomText(
                                  text: '012545162626',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF4a4a4a),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerRight*0.7,
                    child: CustomText(
                      text: 'منتجاتي المضافه',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4a4a4a),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                      child: SizedBox(
                        height: 500.h,
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return ProductItemWidget();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    ));
  }
}
