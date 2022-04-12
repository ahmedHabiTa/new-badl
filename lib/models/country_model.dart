// To parse this JSON data, do
//
//     final countyModel = countyModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CounrtyModel countyModelFromMap(String str) => CounrtyModel.fromMap(json.decode(str));

String countyModelToMap(CounrtyModel data) => json.encode(data.toMap());

class CounrtyModel {
  CounrtyModel({
    required this.data,
     this.success,
  });

  final List<CountryDetails> data;
   bool? success;

  factory CounrtyModel.fromMap(Map<String, dynamic> json) => CounrtyModel(
    data: List<CountryDetails>.from(json["data"].map((x) => CountryDetails.fromMap(x))),
    success: json["success"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "success": success,
  };
}

class CountryDetails {
  CountryDetails({
    required this.id,
    required this.title,
    required this.code,
  });

  final int id;
  final String title;
  final String code;

  factory CountryDetails.fromMap(Map<String, dynamic> json) => CountryDetails(
    id: json["id"],
    title: json["title"],
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "code": code,
  };
}
