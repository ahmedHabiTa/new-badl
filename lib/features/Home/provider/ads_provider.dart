import 'dart:convert';
import 'dart:io';

import 'package:badl/models/ad_details_model.dart';
import 'package:badl/models/latest_ads_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/util/api_base_helper.dart';

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
        _searchedList = _adDetailsList!.where((element) => element.name.contains(name)).toList();
        print(_searchedList.first.name);
      }
      if(name.isEmpty){
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
