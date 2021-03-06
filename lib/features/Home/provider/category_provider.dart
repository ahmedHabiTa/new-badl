import 'dart:convert';

import 'package:badl/models/main_category_model.dart';
import 'package:badl/models/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/util/api_base_helper.dart';
import '../../../models/latest_ads_model.dart';

class CategoryProvider extends ChangeNotifier {
  bool isLoading = false;


  List<MainCategoryDetails>? _mainCategories;

  List<MainCategoryDetails> get mainCategories => _mainCategories!;

  Future<void> getMainCategory() async {
    isLoading = true;
    try {
      final response = await ApiBaseHelper.get(url: 'api/categories');
      if (response.statusCode == 200) {
        List result = json.decode(response.body)['data'];
        _mainCategories =
            result.map((e) => MainCategoryDetails.fromJson(e)).toList();
      }
    } catch (error) {
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
  }




  List<SubCategoryDetails>? _subCategories;

  List<SubCategoryDetails> get subCategories => _subCategories!;
  Future<void> getSubCategoryById({
  required int categoryId,
}) async {
    isLoading = true;
    try {
      final response = await ApiBaseHelper.get(url: 'api/category/${categoryId.toString()}');
      if (response.statusCode == 200) {
        List result = json.decode(response.body)['data'];
        _subCategories =
            result.map((e) => SubCategoryDetails.fromJson(e)).toList();
      }
    } catch (error) {
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
  }

  List<AdDetails>? _adDetailsList;

  List<AdDetails>? get adDetailsList => _adDetailsList;

  Future<void> getAdsByCategory({
  required String categoryId
}) async {
    isLoading = true;

    try {
      final response = await ApiBaseHelper.get(url: 'api/bycat/all/$categoryId');
print(response.statusCode);
      if (response.statusCode == 200) {
        List result = json.decode(response.body)['data']['data'];
        _adDetailsList =
            result.map((e) => AdDetails.fromJson(e)).cast<AdDetails>().toList();
        print(_adDetailsList?.length);
       // print(_adDetailsList?.first.image);
      }
    } catch (error) {
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
  }
}
