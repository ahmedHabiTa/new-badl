// To parse this JSON data, do
//
//     final postAdModel = postAdModelFromJson(jsonString);

import 'dart:convert';

PostAdModel postAdModelFromJson(String str) => PostAdModel.fromJson(json.decode(str));

String postAdModelToJson(PostAdModel data) => json.encode(data.toJson());

class PostAdModel {
  PostAdModel({
    required this.data,
    this.success,
  });

  PostAdResponse data;
  bool? success;

  factory PostAdModel.fromJson(Map<String, dynamic> json) => PostAdModel(
    data: PostAdResponse.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
  };
}

class PostAdResponse {
  PostAdResponse({
  required  this.name,
 required   this.desc,
    this.countryId,
    this.cityId,
    this.townId,
 required   this.categoryId,
   required this.subCategoryId,
    this.userId,
    this.slug,
    this.updatedAt,
    this.createdAt,
   required this.id,
    required this.favoried,
    this.image,
  });

  String name;
  String desc;
  String? countryId;
  String? cityId;
  String? townId;
  String categoryId;
  String subCategoryId;
  int? userId;
  String? slug;
  DateTime? updatedAt;
  DateTime? createdAt;
  int id;
  bool favoried;
  String? image;

  factory PostAdResponse.fromJson(Map<String, dynamic> json) => PostAdResponse(
    name: json["name"],
    desc: json["desc"],
    countryId: json["country_id"],
    cityId: json["city_id"],
    townId: json["town_id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    userId: json["user_id"],
    slug: json["slug"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    favoried: json["favoried"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "desc": desc,
    "country_id": countryId,
    "city_id": cityId,
    "town_id": townId,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "user_id": userId,
    "slug": slug,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "favoried": favoried,
    "image": image,
  };
}
