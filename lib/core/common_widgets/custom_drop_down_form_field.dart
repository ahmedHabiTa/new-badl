import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';


class CustomDropDownFormField extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<String>> items;
  final Function(String)? onChanged;
  final double? iconSize;

  const CustomDropDownFormField({
    Key? key,
    required this.title,
    required this.items,
     this.onChanged,
     this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: MyColors.fieldContainerColors,
      ),
      child: DropdownButtonFormField<String>(
        iconSize: iconSize ??0,
        onTap: () => FocusScope.of(context).unfocus(),
        validator: (value) {
          return null;
        },
        isExpanded: true,
        decoration: InputDecoration(
          // fillColor: Colors.grey[50],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          hintText: title,
          hintStyle:const TextStyle(fontSize: 12),
        ),
        items: items,
        onSaved: (value) {},
        onChanged: (value) =>onChanged!(value!),
      ),
    );
  }
}
