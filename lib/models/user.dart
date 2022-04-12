// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
  required  this.user,
   required this.token,
  });

  User user;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
   required this.mobile,
   required this.name,
   required this.countryId,
   required this.type,
    this.updatedAt,
    this.createdAt,
    this.hasStore,
    this.image,
  required  this.id,
  });

  String mobile;
  String name;
  String countryId;
  String type;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? hasStore;
  String?image;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    mobile: json["mobile"],
    name: json["name"],
    countryId: json["country_id"],
    type: json["type"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    hasStore: json["has_store"],
    image: json['image'],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "name": name,
    "country_id": countryId,
    "type": type,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "has_store":hasStore,
    'image' : image,
    "id": id,
  };
}
