import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/home__item_card.dart';
import 'package:badl/core/common_widgets/loading_widget.dart';
import 'package:badl/features/Home/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../models/sub_category_model.dart';

class CategoryScreen extends StatelessWidget {
  final int categoryId;
  final String title;

  const CategoryScreen({
    Key? key,
    required this.categoryId,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(categoryId);
 //   Provider.of<CategoryProvider>(context,).getAdsByCategory(categoryId: categoryId.toString());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: title,
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
      body: SizedBox(
        height: 800.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Consumer<CategoryProvider>(
              builder: (context, catProvider, _) {
                return catProvider.isLoading == true
                    ? const Center(
                        child: LoadingWidget(),
                      )
                    : catProvider.adDetailsList!.isEmpty
                        ? const Padding(
                          padding:  EdgeInsets.only(top: 80.0),
                          child: Center(
                              child: Text('لا توجد اعلانات حاليا'),
                            ),
                        )
                        : Padding(
                            padding:
                                const EdgeInsets.only(left: 14.0, right: 14.0),
                            child: SizedBox(
                              height: 650.h,
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: catProvider.adDetailsList!.length,
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
                                      id: catProvider.adDetailsList![index].id,
                                      image: catProvider.adDetailsList![index].image,
                                      title: catProvider.adDetailsList![index].name,
                                    );
                                  }),
                            ),
                          );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
