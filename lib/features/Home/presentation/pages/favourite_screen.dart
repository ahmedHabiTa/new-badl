//
// import 'package:badl/core/common_widgets/custom_text.dart';
// import 'package:badl/core/common_widgets/home__item_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// class FavouriteScreen extends StatelessWidget {
//   const FavouriteScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: Colors.white,
//             centerTitle: true,
//             title: CustomText(
//               text: 'المفضله',
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: const Color(0xFF2b2b2b),
//             ),
//             leading: GestureDetector(
//               onTap: ()=>Navigator.pop(context),
//               child: const Icon(
//                 Icons.arrow_back_ios_rounded,
//                 color: Color(0xFF1a0405),
//               ),
//             ),
//           ),
//           body: SizedBox(
//             height: 800.h,
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 14.0, right: 14.0),
//                   child: SizedBox(
//                     height: 650.h,
//                     child: GridView.builder(
//                       // physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 2 / 2.5,
//                           crossAxisSpacing: 12,
//                           mainAxisSpacing: 10,
//                         ),
//                         itemBuilder: (context, index) {
//                           return HomeItemCard(
//
//                           );
//                         }),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ));
//   }
// }
