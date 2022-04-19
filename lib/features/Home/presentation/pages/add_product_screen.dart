import 'package:badl/core/colors.dart';
import 'package:badl/core/common_widgets/custom_drop_down_form_field.dart';
import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/custom_text_form_field.dart';
import 'package:badl/core/common_widgets/custom_wide_buttom.dart';
import 'package:badl/core/common_widgets/loading_widget.dart';
import 'package:badl/core/constants.dart';
import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:badl/features/Home/provider/ads_provider.dart';
import 'package:badl/features/Home/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/common_widgets/custom_dialog.dart';

class AddOfferScreen extends StatefulWidget {
  const AddOfferScreen({Key? key}) : super(key: key);

  @override
  State<AddOfferScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {
  String? categoryId;
  String? subCategoryId;
  bool visible = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descController = TextEditingController();

  bool isLoading = false;

  toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const CustomText(
          text: 'اضافه اعلان',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2b2b2b),
        ),
        // leading: GestureDetector(
        //   onTap: () => Navigator.pop(context),
        //   child: const Icon(
        //     Icons.arrow_back_ios_rounded,
        //     color: Color(0xFF1a0405),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SizedBox(
            height: 700.h,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: nameController,
                    onChanged: (value) {
                      setState(() {
                        value = nameController.text.toString();
                      });
                    },
                    validation: 'الاسم مطلوب',
                    width: 320.w,
                    height: 55.h,
                    hintText: 'اسم الاعلان',
                    backgroundColor: const Color(0xFFf3f3f3),
                  ),
                  const SizedBox(height: 15),
                  Consumer<CategoryProvider>(
                    builder: (context, catProvider, _) {
                      return CustomDropDownFormField(
                        onChanged: (value) {
                          setState(() {
                            categoryId = value;
                          });
                        },
                        title: 'القسم',
                        items: catProvider.mainCategories.map(
                          (e) {
                            return DropdownMenuItem<String>(
                              onTap: () async {
                                setState(() {
                                  categoryId = e.id.toString();
                                });
                                print(categoryId);
                                await catProvider.getSubCategoryById(
                                    categoryId: int.parse(categoryId!));
                                setState(() {
                                  visible = true;
                                });
                              },
                              child: Text(
                                e.title,
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              value: e.id.toString(),
                            );
                          },
                        ).toList(),
                      );
                    },
                  ),
                  visible == false ? Container() : const SizedBox(height: 15),
                  visible == false
                      ? Container()
                      : Consumer<CategoryProvider>(
                          builder: (context, catProvider, _) {
                            return CustomDropDownFormField(
                              onChanged: (value) {
                                setState(() {
                                  subCategoryId = value;
                                });
                              },
                              title: 'القسم الفرعي',
                              items: catProvider.subCategories.map(
                                (e) {
                                  return DropdownMenuItem<String>(
                                    onTap: () async {
                                      setState(() {
                                        subCategoryId = e.id.toString();
                                      });
                                      print("sub id :" +
                                          subCategoryId.toString());
                                    },
                                    child: Text(
                                      e.title,
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                    value: e.id.toString(),
                                  );
                                },
                              ).toList(),
                            );
                          },
                        ),
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: descController,
                    width: 320.w,
                    height: 120.h,
                    hintText: 'وصف المنتج',
                    backgroundColor: const Color(0xFFf3f3f3),
                    onChanged: (value) {
                      value = descController.text.toString();
                    },
                    validation: 'هذا الحقل مطلوب',
                    maxLine: 10,
                  ),
                  const SizedBox(height: 15),
                  Provider.of<AdsProvider>(
                            context,
                          ).image !=
                          null
                      ? GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return SizedBox(
                                    height: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Provider.of<AdsProvider>(context,
                                                    listen: false)
                                                .pickImage(
                                                    imageSource:
                                                        ImageSource.camera);
                                          },
                                          child: const CustomText(
                                            text: 'Camera',
                                            color: MyColors.meanColor,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Provider.of<AdsProvider>(context,
                                                    listen: false)
                                                .pickImage(
                                                    imageSource:
                                                        ImageSource.gallery);
                                          },
                                          child: const CustomText(
                                            text: 'Gallery',
                                            color: MyColors.meanColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 168,
                            width: 328.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFFe5e5e5),
                                borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(
                                      Provider.of<AdsProvider>(context).image!),
                                )),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return SizedBox(
                                    height: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Provider.of<AdsProvider>(context,
                                                    listen: false)
                                                .pickImage(
                                                    imageSource:
                                                        ImageSource.camera);
                                          },
                                          child: const CustomText(
                                            text: 'Camera',
                                            color: MyColors.meanColor,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Provider.of<AdsProvider>(context,
                                                    listen: false)
                                                .pickImage(
                                                    imageSource:
                                                        ImageSource.gallery);
                                          },
                                          child: const CustomText(
                                            text: 'Gallery',
                                            color: MyColors.meanColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 168,
                            width: 328.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFFe5e5e5),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: const Center(
                              child: Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 37,
                                color: Color(0xFF4a4a4a),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 15),
                  isLoading == true
                      ? const Center(
                          child: LoadingWidget(),
                        )
                      : Consumer<AdsProvider>(
                          builder: (context, adsProvider, _) {
                            return CustomWideButtom(
                              height: 56.h,
                              width: 320.w,
                              color: MyColors.meanColor,
                              onTap: () async {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                if (categoryId == null ||
                                    subCategoryId == null) {
                                  Constants.showToast(
                                      message:
                                          'من فضلك اختر القسم والقسم الفرعي',
                                      color: Colors.red);
                                } else {
                                  final token = await SharedPrefsHelper.getData(
                                      key: 'token');
                                  if (token == '1') {
                                    return CustomDialog.customDialog(context: context);
                                  } else {
                                    toggleLoading();
                                    await adsProvider.postAd(
                                      name: nameController.text,
                                      desc: descController.text,
                                      categoryId: categoryId!,
                                      subCategoryId: subCategoryId!,
                                    );
                                    nameController.clear();
                                    descController.clear();
                                    categoryId = null;
                                    subCategoryId = null;
                                    toggleLoading();
                                  }
                                }
                                // Constants.navigateToRep(
                                //     routeName: TabsScreen(), context: context);
                              },
                              child: const Center(
                                child: CustomText(
                                  text: 'نشر الاعلان',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFffffff),
                                ),
                              ),
                            );
                          },
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
