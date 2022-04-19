import 'dart:convert';

import 'package:badl/core/util/api_base_helper.dart';
import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:badl/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  bool isLoading = false;

  List<NotificationDetails>? _notificationsList;
  List<NotificationDetails> get notificationsList => _notificationsList! ;

  Future<void> getMyNotifications() async {
    isLoading = true;
    final token = await SharedPrefsHelper.getData(key: 'token');

    if (token == "1") {
      print('UnAuthorized');
    } else {
      try {
        final response = await ApiBaseHelper.get(
          url: 'api/notifications',
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer $token",
          },
        );
        print('statusCode is : ${response.statusCode}');
        if(response.statusCode == 200){
          List result = json.decode(response.body)['data']['data'];
          _notificationsList = result.map((e) => NotificationDetails.fromJson(e)).toList();
          print(_notificationsList!.length);
        }
        notifyListeners();
      } catch (error) {
        print("notification error is : $error");
        throw UnimplementedError();
      }
      isLoading = false;
      notifyListeners();
    }
  }

}
