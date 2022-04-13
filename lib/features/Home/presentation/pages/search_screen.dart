import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/custom_text_form_field.dart';
import 'package:badl/core/common_widgets/home__item_card.dart';
import 'package:badl/features/Home/provider/ads_provider.dart';
import 'package:badl/models/ad_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  String? adName;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: 'البحث',
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
      body: Consumer<AdsProvider>(
        builder: (context, adProvider, _) {

          return SizedBox(
            height: 800.h,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  CustomFormField(
                    controller: searchController,
                    prefix: Icon(
                      Icons.search_outlined,
                      color: Color(0xFF666666),
                    ),
                    hintText: 'ابحث عن منتج',
                    height: 55.h,
                    width: 328.w,
                    onChanged: (value)  {
                      //ToDo:لما اكتب حجخ ابع لل api اجيب الداتا اللي بتحتوي علي الكلام
                      setState(() {
                        value = searchController.text.toString();
                      });
                      print(searchController.text.toString());
                        adProvider.searchAds(name: searchController.text.toString());
                    },
                  ),
                  const SizedBox(height: 20),
                  adProvider.searchedList.isEmpty
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                          child: SizedBox(
                            height: 580.h,
                            child: GridView.builder(
                              itemCount: adProvider.searchedList.length,
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
                                    id: adProvider.searchedList[index].id,
                                  );
                                }),
                          ),
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
