import 'package:badl/core/common_widgets/bottom_sheet.dart';
import 'package:badl/core/common_widgets/home__item_card.dart';
import 'package:badl/features/Home/presentation/widgets/custom_row_texts.dart';
import 'package:badl/features/Home/presentation/widgets/home_app_bar.dart';
import 'package:badl/features/Home/presentation/widgets/home_sections.dart';
import 'package:badl/features/Home/provider/ads_provider.dart';
import 'package:badl/features/Home/provider/category_provider.dart';
import 'package:badl/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common_widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HomeAppBar(),
              const SizedBox(height: 10),
              CustomRowText(
                //Todo: implement the bottom sheet
                onTap: () {
                  print('show bottom sheet');
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetWidget();
                    },
                  );
                },
                rightText: 'الاقسام',
                leftText: 'خدمه',
              ),
              const SizedBox(height: 10),
              Consumer<CategoryProvider>(
                builder: (BuildContext context, catProvider, _) {
                  return catProvider.isLoading == true
                      ? const LoadingWidget()
                      : CustomRowFields(
                          mainCategoriesList: catProvider.mainCategories,
                        );
                },
              ),
              const SizedBox(height: 10),
              CustomRowText(
                //Todo: implement the bottom sheet
                onTap: () => print('المضاف حديثا'),
                rightText: 'المضاف حديثا',
                leftText: 'الكل',
              ),
              const SizedBox(height: 10,),
              Consumer<AdsProvider>(
                builder: (context,adProvider,_){
                  return adProvider.isLoading == true ? Container(): Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                    child: SizedBox(
                      height: 400.h,
                      child: GridView.builder(
                        itemCount: adProvider.adDetailsList!.length,
                        // physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.5,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return HomeItemCard(
                              id:adProvider.adDetailsList![index].id,
title:adProvider.adDetailsList![index].name,
                              image:adProvider.adDetailsList![index].image ,
                            );
                          }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
