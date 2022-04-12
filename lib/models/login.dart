
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
   required this.status,
    this.success,
  });

  String status;
  bool? success;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
  };
}
