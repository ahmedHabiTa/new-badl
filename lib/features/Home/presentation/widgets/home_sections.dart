import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/features/Home/presentation/pages/section_screen.dart';
import 'package:badl/core/constants.dart';
import 'package:badl/models/main_category_model.dart';
import 'package:badl/models/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowFields extends StatelessWidget {
  final List<MainCategoryDetails> mainCategoriesList;

  const CustomRowFields({
    Key? key,
    required this.mainCategoriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24.0,
        left: 24.0,
      ),
      child: SizedBox(
        height: 50.h,
        child: ListView.builder(
          //physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: mainCategoriesList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Constants.navigateTo(
                  routeName: SectionScreen(
                    categoryId: mainCategoriesList[index].id,
                    title: mainCategoriesList[index].title,
                  ),
                  context: context,
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 50.h,
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  decoration: BoxDecoration(
                      color: const Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(mainCategoriesList[index].image),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomText(
                        text: mainCategoriesList[index].title,
                        color: const Color(0xFF2b2b2b),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
