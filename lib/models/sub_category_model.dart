// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());

class SubCategoryModel {
  SubCategoryModel({
    required this.data,
    this.success,
  });

  List<SubCategoryDetails> data;
  bool? success;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    data: List<SubCategoryDetails>.from(json["data"].map((x) => SubCategoryDetails.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
  };
}

class SubCategoryDetails {
  SubCategoryDetails({
    required   this.id,
    required  this.title,
    required  this.image,
  });

  int id;
  String title;
  String image;

  factory SubCategoryDetails.fromJson(Map<String, dynamic> json) => SubCategoryDetails(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}
