import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/features/Home/presentation/widgets/product_item_widget.dart';
import 'package:badl/features/Home/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common_widgets/loading_widget.dart';

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
          height: 600.h,
          width: double.infinity,
          child: Consumer<UserProvider>(
            builder: (context, userProvider, _){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  userProvider.isLoading == true
                      ?  Container()
                      : Padding(
                    padding: const EdgeInsets.only(right: 17.0),
                    child: CustomText(
                      text: userProvider.adDetailsList!.length.toString()+ " منتج",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2b2b2b),
                    ),
                  ),
                  const SizedBox(height: 15),
                  userProvider.isLoading == true
                      ? const Center(
                    child: LoadingWidget(),
                  )
                      : userProvider.adDetailsList!.isEmpty
                      ? Container()
                      : Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15.0),
                      child: SizedBox(
                        height: 500.h,
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return ProductItemWidget(
                              title: userProvider
                                  .adDetailsList![index].name,
                              categoryName: userProvider
                                  .adDetailsList![index].categoryName,
                              image: userProvider.adDetailsList![index].image,
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}
