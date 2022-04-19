import 'package:badl/core/colors.dart';
import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/custom_text_form_field.dart';
import 'package:badl/core/common_widgets/custom_wide_buttom.dart';
import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:badl/features/Home/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/common_widgets/custom_drop_down_form_field.dart';
import '../../../../core/common_widgets/loading_widget.dart';
import '../../../../core/providers/country_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? countryCode;
  String? countryID;
  final nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  toggleLoading() {
    isLoading = !isLoading;
  }

  @override
  Widget build(BuildContext context) {
    // final username = SharedPrefsHelper.getData(key: 'username');
    final countryId = SharedPrefsHelper.getData(key: 'userCountryID');
    final token = SharedPrefsHelper.getData(key: 'token');
    // final mobile = SharedPrefsHelper.getData(key: 'userMobile');
    // final image = SharedPrefsHelper.getData(key: 'image');
    Provider.of<UserProvider>(context, listen: false).getUserData();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const CustomText(
            text: 'تعديل الملف الشخصي',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2b2b2b),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xFF1a0405),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SizedBox(
              width: double.infinity,
              height: 600.h,
              child: token == "1"
                  ? const Center(
                      child: CustomText(
                        text: 'غير مصرح لك من فضلك سجل الدخول اولا',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )
                  : Consumer<UserProvider>(
                      builder: (context, userProvider, _) {
                        return userProvider.userProfile == null
                            ? const Center(
                                child: LoadingWidget(),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerRight * 0.8,
                                      child: const CustomText(
                                        text: 'اسم المستخدم',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4a4a4a),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomFormField(
                                      // controller: nameController,
                                      onChanged: (value) {
                                        setState(() {
                                          value =
                                              nameController.text.toString();
                                        });
                                      },
                                      height: 60.h,
                                      hintText: 'الاسم',
                                      initialValue:
                                          userProvider.userProfile!.name,
                                      prefix: const Icon(
                                        Icons.person,
                                        color: Color(0xFF4a4a4a),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerRight * 0.8,
                                      child: const CustomText(
                                        text: 'الهاتف المحمول',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4a4a4a),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomFormField(
                                          readOnly: true,
                                          hintText: 'الهاتف المحمول',
                                          initialValue:
                                              userProvider.userProfile!.mobile,
                                          width: 253.w,
                                          height: 70.h,
                                          prefix: const Icon(
                                            Icons.add_ic_call_outlined,
                                            size: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Consumer<CountryProvider>(
                                          builder:
                                              (context, countryProvider, _) {
                                            return countryProvider.isLoading ==
                                                    true
                                                ? const LoadingWidget()
                                                : Container(
                                                    height: 70.h,
                                                    width: 66.w,
                                                    decoration: BoxDecoration(
                                                      color: MyColors
                                                          .fieldContainerColors,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: Center(
                                                      child:
                                                          CustomDropDownFormField(
                                                        onChanged: (value) {
                                                          setState(() {
                                                            countryCode = value;
                                                          });
                                                          print(countryCode);
                                                        },
                                                        title: 'الدوله',
                                                        items: countryProvider
                                                            .countryList!
                                                            .map(
                                                          (e) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              onTap: () {
                                                                setState(() {
                                                                  countryID = e
                                                                      .id
                                                                      .toString();
                                                                });
                                                                print(
                                                                    countryID);
                                                              },
                                                              child: Text(
                                                                e.code,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp),
                                                              ),
                                                              value: e.code
                                                                  .toString(),
                                                            );
                                                          },
                                                        ).toList(),
                                                      ),
                                                    ),
                                                  );
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerRight * 0.8,
                                      child: const CustomText(
                                        text: 'الصوره الشخصيه',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4a4a4a),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    userProvider.image != null
                                        ? GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (_) {
                                                    return SizedBox(
                                                      height: 120,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              Provider.of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .pickImage(
                                                                      imageSource:
                                                                          ImageSource
                                                                              .camera);
                                                            },
                                                            child:
                                                                const CustomText(
                                                              text: 'Camera',
                                                              color: MyColors
                                                                  .meanColor,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Provider.of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .pickImage(
                                                                      imageSource:
                                                                          ImageSource
                                                                              .gallery);
                                                            },
                                                            child:
                                                                const CustomText(
                                                              text: 'Gallery',
                                                              color: MyColors
                                                                  .meanColor,
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
                                                  color:
                                                      const Color(0xFFe5e5e5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: FileImage(
                                                        userProvider.image!),
                                                  )),
                                            ))
                                        : GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (_) {
                                                    return SizedBox(
                                                      height: 120,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              Provider.of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .pickImage(
                                                                      imageSource:
                                                                          ImageSource
                                                                              .camera);
                                                            },
                                                            child:
                                                                const CustomText(
                                                              text: 'Camera',
                                                              color: MyColors
                                                                  .meanColor,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Provider.of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .pickImage(
                                                                      imageSource:
                                                                          ImageSource
                                                                              .gallery);
                                                            },
                                                            child:
                                                                const CustomText(
                                                              text: 'Gallery',
                                                              color: MyColors
                                                                  .meanColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Container(
                                              width: 320.w,
                                              height: 180,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          userProvider
                                                              .userProfile!
                                                              .image!))),
                                            ),
                                          ),
                                    const SizedBox(height: 20),
                                    Consumer<UserProvider>(
                                      builder: (context, userProvider, _) {
                                        return CustomWideButtom(
                                          height: 56.h,
                                          width: 328.w,
                                          color: MyColors.meanColor,
                                          onTap: () async {
                                            if (!formKey.currentState!
                                                .validate()) {
                                              return;
                                            } else {
                                              toggleLoading();
                                              await userProvider.updateProfile(
                                                  name: nameController.text
                                                      .toString());
                                              toggleLoading();
                                            }
                                          },
                                          child: const Center(
                                            child: CustomText(
                                              text: 'حفظ التعديلات',
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
                              );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
