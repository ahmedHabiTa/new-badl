import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/country_model.dart';
import '../util/api_base_helper.dart';
class CountryProvider extends ChangeNotifier{

  List<CountryDetails>? _countryList;

  List<CountryDetails>? get countryList => _countryList;
  bool isLoading = false;

  Future<void> getCountry() async {
    isLoading = true;
    try {
      final response = await ApiBaseHelper.get(url: 'api/countries');

      if (response.statusCode == 200) {
        List result = json.decode(response.body)['data'];
        _countryList = result.map((e) => CountryDetails.fromMap(e)).toList();
        print(_countryList?.first.title);
      }
    } catch (error) {
      throw UnimplementedError();
    }
    isLoading = false;
    notifyListeners();
  }

}