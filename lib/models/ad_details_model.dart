// To parse this JSON data, do
//
//     final adDetailsModel = adDetailsModelFromJson(jsonString);

import 'dart:convert';

AdDetailsModel adDetailsModelFromJson(String str) => AdDetailsModel.fromJson(json.decode(str));

String adDetailsModelToJson(AdDetailsModel data) => json.encode(data.toJson());

class AdDetailsModel {
  AdDetailsModel({
   required this.data,
    this.success,
  });

  AdModel data;
  bool? success;

  factory AdDetailsModel.fromJson(Map<String, dynamic> json) => AdDetailsModel(
    data: AdModel.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
  };
}

class AdModel {
  AdModel({
   required this.id,
    required  this.name,
    required  this.price,
    required  this.type,
    required  this.userId,
    required  this.desc,
    this.mobile,
    this.userName,
    this.userImage,
    required   this.categoryName,
    required   this.countryCurrency,
    required  this.favoried,
    required   this.image,
    required  this.images,
  });

  int id;
  String name;
  String price;
  String type;
  int userId;
  String desc;
  dynamic mobile;
  dynamic userName;
  dynamic userImage;
  String categoryName;
  String countryCurrency;
  bool favoried;
  String image;
  List<dynamic> images;

  factory AdModel.fromJson(Map<String, dynamic> json) => AdModel(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    type: json["type"],
    userId: json["user_id"],
    desc: json["desc"],
    mobile: json["mobile"],
    userName: json["user_name"],
    userImage: json["user_image"],
    categoryName: json["category_name"],
    countryCurrency: json["country_currency"],
    favoried: json["favoried"],
    image: json["image"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "type": type,
    "user_id": userId,
    "desc": desc,
    "mobile": mobile,
    "user_name": userName,
    "user_image": userImage,
    "category_name": categoryName,
    "country_currency": countryCurrency,
    "favoried": favoried,
    "image": image,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
