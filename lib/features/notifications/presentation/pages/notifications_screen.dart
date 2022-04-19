import 'package:badl/core/common_widgets/custom_text.dart';
import 'package:badl/core/common_widgets/loading_widget.dart';
import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:badl/features/notifications/presentation/widgets/notification_item_card.dart';
import 'package:badl/features/notifications/provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final token = SharedPrefsHelper.getData(key: 'token');
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const CustomText(
              text: 'التنبيهات',
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
          body: SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: double.infinity,
            child: token == "1" ? const Center(
              child: CustomText(
                text: 'غير مصرح لك من فضلك سجل الدخول اولا',
                fontSize: 20,
                color: Colors.black,
              ),
            ) : Consumer<NotificationProvider>(
              builder: (context, notificationProvider, _) {
                return notificationProvider.isLoading == true ? const Center(
                  child: LoadingWidget(),
                ) : notificationProvider.notificationsList.isEmpty
                    ? const Center(
                  child: CustomText(text: 'لا توجد اشعارات حاليا',
                    fontSize: 20,
                    color: Colors.black,),) : ListView.builder(
                  itemCount: notificationProvider.notificationsList.length,
                  itemBuilder: (context, index) {
                    return const NotificationItemCard();
                  },
                );
              },

            ),
          ),
        ));
  }
}
