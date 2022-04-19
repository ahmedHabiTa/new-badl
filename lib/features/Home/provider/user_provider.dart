import 'dart:convert';
import 'dart:io';

import 'package:badl/core/constants.dart';
import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:badl/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/services.dart';
import '../../../core/common_widgets/custom_dialog.dart';
import '../../../core/util/api_base_helper.dart';
import '../../../models/latest_ads_model.dart';
import '../../../models/post_ad_offer_model.dart';

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

  UserProfile? userProfile;

  Future<void> getUserData() async {
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
    required ImageSource imageSource,
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

  Future<void> toggleFavourite({required String id,required BuildContext context}) async {
    final token = await SharedPrefsHelper.getData(key: 'token');
    if(token == '1'){
     return CustomDialog.customDialog(context: context);
    }else{
      try{
        final response = await ApiBaseHelper.get(
          url: 'api/favourite/$id',
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization" : "Bearer $token",
          },
        );

        print("id is : $id");
        print(response.statusCode );

        if(response.statusCode == 200){
          final result = json.decode(response.body)['message'];
          Constants.showToast(message: result, color: Colors.white);
          print("result is : $result");
        }
      }catch (error){
        print("Favourite error is : $error");
        throw UnimplementedError();
      }
    }
  }

  Future<void> postAdOffer({
    required String adId,
    required String offerAdId,
    required BuildContext context,
  }) async {
    final token = await SharedPrefsHelper.getData(key: 'token');
    if(token == "1"){
      return CustomDialog.customDialog(context: context);
    }else{
      try {
        final response = await ApiBaseHelper.post(
          url: 'api/post-offer',
          body: {"ad_id": adId, "offer_ad_id": offerAdId},
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer $token",
          },
        );
        print('statusCode is : ${response.statusCode}');
        print("adId is : $adId");
        print("offerAdId is : $offerAdId");
        if (response.statusCode == 201) {
          final result =
          PostAdOfferDetails.fromJson(json.decode(response.body)['data']);
          Constants.showToast(message: 'تم التبادل', color: Colors.green);
          print('result is : ${result.offerAdId}');
        }
      } catch (error) {
        print("Error is : $error");
        Constants.showToast(message: 'حدث خطأ', color: Colors.red);
        throw UnimplementedError();
      }
    }
  }
}
