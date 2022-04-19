import 'dart:convert';
import 'dart:io';

import 'package:badl/core/constants.dart';
import 'package:badl/core/util/shared_pref_helper.dart';
import 'package:badl/models/ad_details_model.dart';
import 'package:badl/models/latest_ads_model.dart';
import 'package:badl/models/post_ad_offer_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/util/api_base_helper.dart';
import '../../../models/post_ad_model.dart';
import 'package:http/http.dart' as http;

class AdsProvider extends ChangeNotifier {
  bool isLoading = false;
  List<AdDetails>? _adDetailsList;

  List<AdDetails>? get adDetailsList => _adDetailsList;

  Future<void> getLatestAds() async {
    isLoading = true;

    try {
      final response = await ApiBaseHelper.get(url: 'api/ads');

      if (response.statusCode == 200) {
        List result = json.decode(response.body)['data']['data'];
        _adDetailsList =
            result.map((e) => AdDetails.fromJson(e)).cast<AdDetails>().toList();
        print(_adDetailsList?.first.name);
        print(_adDetailsList?.first.image);
      }
    } catch (error) {
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
  }

  AdModel? adModel;

  Future<void> getAdById({
    required String id,
  }) async {
    isLoading = true;

    try {
      final response = await ApiBaseHelper.get(url: 'api/ad/$id');

      if (response.statusCode == 200) {
        final result = AdModel.fromJson(json.decode(response.body)['data']);
        adModel = result;
        print(adModel!);
      }
    } catch (error) {
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
  }

  List<AdDetails> _searchedList = [];

  List<AdDetails> get searchedList => _searchedList;

  Future<void> searchAds({
    required String name,
  }) async {
    isLoading = true;

    try {
      final response = await ApiBaseHelper.get(url: 'api/ads');

      if (response.statusCode == 200) {
        List result = json.decode(response.body)['data']['data'];
        _adDetailsList =
            result.map((e) => AdDetails.fromJson(e)).cast<AdDetails>().toList();
        _searchedList = _adDetailsList!
            .where((element) => element.name.contains(name))
            .toList();
        print(_searchedList.first.name);
      }
      if (name.isEmpty) {
        _searchedList.clear();
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
  Future<String?> uploadImage({filepath, url}) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', filepath));
    var res = await request.send();
    return res.reasonPhrase;
  }

  Future<void> postAd({
    required String name,
    required String desc,
    required String categoryId,
    required String subCategoryId,
  }) async {
    isLoading = true;
    final token = await SharedPrefsHelper.getData(key: 'token');
    final Map<String,dynamic> body ;
    if(image !=null){
      final imageUrl = await uploadImage(url: 'https://newsooq.waitbuzz.net/api/post-ad',filepath: image!.path);
      body = {
        'name': name,
        "desc": desc,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "image" : imageUrl
      };
      notifyListeners();
    }else{
      body = {
        'name': name,
        "desc": desc,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
      };
      notifyListeners();
    }
    try {
      final response =
          await ApiBaseHelper.post(url: 'api/post-ad', body: body, headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Bearer $token"
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        final result =
            PostAdResponse.fromJson(json.decode(response.body)['data']);
        Constants.showToast(message: 'تم نشر الاعلان بنجاح..انتظر التأكيد', color: Colors.green);
        print(result.image);
      }
    } catch (error) {
      print("Error is : $error");
      throw UnimplementedError();
    }
    isLoading = false;
    image = null;
    notifyListeners();
  }


}
