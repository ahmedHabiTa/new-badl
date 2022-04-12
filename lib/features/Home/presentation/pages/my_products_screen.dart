import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/features/Home/presentation/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: 'منتجاتي',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2b2b2b),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 17.0),
                child: CustomText(
                  text: '3 منتجات',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2b2b2b),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
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
