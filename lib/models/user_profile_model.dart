// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    required this.data,
    this.success,
  });

  UserProfile data;
  bool? success;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        data: UserProfile.fromJson(json["data"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "success": success,
      };
}

class UserProfile {
  UserProfile({
    required this.id,
    required this.name,
    required this.mobile,
    required this.countryId,
    required this.type,
    this.hasStore,
    this.image,
    required this.deviceToken,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String mobile;
  int countryId;
  String type;
  int? hasStore;
  String? image;
  dynamic deviceToken;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        countryId: json["country_id"],
        type: json["type"],
        hasStore: json["has_store"],
        image: json["image"],
        deviceToken: json["device_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "country_id": countryId,
        "type": type,
        "has_store": hasStore,
        "image": image,
        "device_token": deviceToken,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
