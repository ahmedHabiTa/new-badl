// To parse this JSON data, do
//
//     final lastestAdsModel = lastestAdsModelFromJson(jsonString);

import 'dart:convert';

LatestAdsModel lastestAdsModelFromJson(String str) => LatestAdsModel.fromJson(json.decode(str));

String lastestAdsModelToJson(LatestAdsModel data) => json.encode(data.toJson());

class LatestAdsModel {
  LatestAdsModel({
   required this.data,
    this.success,
  });

  Data data;
  bool? success;

  factory LatestAdsModel.fromJson(Map<String, dynamic> json) => LatestAdsModel(
    data: Data.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
  };
}

class Data {
  Data({
    this.currentPage,
    required  this.data,
    this.firstPageUrl,
    this.from,
    required this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    required this.total,
  });

  int? currentPage;
  List<AdDetails> data;
  String? firstPageUrl;
  int? from;
  int lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<AdDetails>.from(json["data"].map((x) => AdDetails.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class AdDetails {
  AdDetails({
   required this.id,
    required this.name,
    required  this.price,
    this.type,
    required  this.userId,
    this.userImage,
    required  this.categoryName,
    required  this.countryCurrency,
    required  this.favoried,
    this.image,
  });

  int id;
  String name;
  String price;
  String? type;
  int userId;
  dynamic userImage;
  String categoryName;
  String countryCurrency;
  bool favoried;
  String? image;

  factory AdDetails.fromJson(Map<String, dynamic> json) => AdDetails(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    type: json["type"],
    userId: json["user_id"],
    userImage: json["user_image"],
    categoryName: json["category_name"],
    countryCurrency: json["country_currency"],
    favoried: json["favoried"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "type": type,
    "user_id": userId,
    "user_image": userImage,
    "category_name": categoryName,
    "country_currency": countryCurrency,
    "favoried": favoried,
    "image": image,
  };
}
