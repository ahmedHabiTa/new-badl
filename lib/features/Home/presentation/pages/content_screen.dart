import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentScreen extends StatelessWidget {
  final String title;
  final String content;

  const ContentScreen({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomText(
                        text: content,
                        letterSpacing: 2,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4a4a4a),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
