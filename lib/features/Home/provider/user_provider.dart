import 'dart:convert';
import 'dart:io';

import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:badl/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/services.dart';
import '../../../core/util/api_base_helper.dart';
import '../../../models/latest_ads_model.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;

  List<AdDetails>? _adDetailsList;

  List<AdDetails>? get adDetailsList => _adDetailsList;

  Future<void> getMyAds() async {
    isLoading = true;
    final token = await SharedPrefsHelper.getData(key: 'token');
    print(token);
    try {
      final response = await ApiBaseHelper.get(
        url: 'api/myads/actived',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        List result = json.decode(response.body)['data']['data'];
        _adDetailsList =
            result.map((e) => AdDetails.fromJson(e)).cast<AdDetails>().toList();
      }
    } catch (error) {
      print(error);
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getMyAdsById() async {
    isLoading = true;
    final token = await SharedPrefsHelper.getData(key: 'token');
    final userId = await SharedPrefsHelper.getData(key: 'userID');
    print(token);
    try {
      final response = await ApiBaseHelper.get(
        url: 'api/user/ads/$userId',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        List result = json.decode(response.body)['data']['data'];
        _adDetailsList =
            result.map((e) => AdDetails.fromJson(e)).cast<AdDetails>().toList();
      }
    } catch (error) {
      print(error);
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
  }
  UserProfile? userProfile ;
    Future<void> getUserData()async{
    isLoading = true;
    final userId = await SharedPrefsHelper.getData(key: 'userID');
    try {
      final response = await ApiBaseHelper.get(url: 'api/user/$userId');

      if (response.statusCode == 200) {
        final result = UserProfile.fromJson(json.decode(response.body)['data']);
        userProfile = result;
        print(userProfile!.name);
      }
    } catch (error) {
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
    }

  File? image;
  Future pickImage({
required  ImageSource imageSource,
}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      notifyListeners();
    } on PlatformException catch (e) {
      print('failed to pick image');
    }
    notifyListeners();
  }


}
