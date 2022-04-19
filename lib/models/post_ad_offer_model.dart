// To parse this JSON data, do
//
//     final postAdOfferModel = postAdOfferModelFromJson(jsonString);

import 'dart:convert';

PostAdOfferModel postAdOfferModelFromJson(String str) => PostAdOfferModel.fromJson(json.decode(str));

String postAdOfferModelToJson(PostAdOfferModel data) => json.encode(data.toJson());

class PostAdOfferModel {
  PostAdOfferModel({
  required  this.data,
    this.success,
  });

  PostAdOfferDetails data;
  bool? success;

  factory PostAdOfferModel.fromJson(Map<String, dynamic> json) => PostAdOfferModel(
    data: PostAdOfferDetails.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
  };
}

class PostAdOfferDetails {
  PostAdOfferDetails({
  required  this.adId,
    required  this.offerAdId,
    this.userId,
    this.offerUserId,
    required this.id,
  });

  String adId;
  String offerAdId;
  int? userId;
  int? offerUserId;
  int id;

  factory PostAdOfferDetails.fromJson(Map<String, dynamic> json) => PostAdOfferDetails(
    adId: json["ad_id"],
    offerAdId: json["offer_ad_id"],
    userId: json["user_id"],
    offerUserId: json["offer_user_id"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "ad_id": adId,
    "offer_ad_id": offerAdId,
    "user_id": userId,
    "offer_user_id": offerUserId,
    "id": id,
  };
}
