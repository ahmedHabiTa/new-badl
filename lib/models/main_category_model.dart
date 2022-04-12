// To parse this JSON data, do
//
//     final mainCategoryModel = mainCategoryModelFromJson(jsonString);

import 'dart:convert';

MainCategoryModel mainCategoryModelFromJson(String str) => MainCategoryModel.fromJson(json.decode(str));

String mainCategoryModelToJson(MainCategoryModel data) => json.encode(data.toJson());

class MainCategoryModel {
  MainCategoryModel({
   required this.data,
    this.success,
  });

  List<MainCategoryDetails> data;
  bool? success;

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) => MainCategoryModel(
    data: List<MainCategoryDetails>.from(json["data"].map((x) => MainCategoryDetails.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
  };
}

class MainCategoryDetails {
  MainCategoryDetails({
   required this.id,
   required this.title,
   required this.image,
  });

  int id;
  String title;
  String image;

  factory MainCategoryDetails.fromJson(Map<String, dynamic> json) => MainCategoryDetails(
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
