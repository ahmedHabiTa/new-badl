import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors.dart';
import 'custom_text.dart';

enum SectionType {all, service, product }

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final List<Map<String, dynamic>> sectionTypeList = [
    {'value': SectionType.all, 'string': 'الكل'},
    {'value': SectionType.service, 'string': 'خدمه'},
    {'value': SectionType.product, 'string': 'سلعه'}
  ];

  String? value;
  SectionType? sectionType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
        const  CustomText(
            text: 'اختر القسم',
            color: Color(0xFF232323),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sectionTypeList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 330.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFFf3f3f3),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              e['string'],
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Radio<SectionType>(
                              fillColor: MaterialStateProperty.all(MyColors.meanColor),
                              value: e['value'],
                              groupValue: sectionType,
                              onChanged: (SectionType? value) {
                                print(value);
                                setState(() {
                                  sectionType = value;
                                });
                              },
                            ),
                          ],
                        )),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
