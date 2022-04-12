import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDropDownFormField extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<String>> items;

  const CustomDropDownFormField({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFFf3f3f3),
      ),
      child: DropdownButtonFormField<String>(
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
        ),
        items: items,
        onSaved: (value) {},
        onChanged: (value) {},
      ),
    );
  }
}
