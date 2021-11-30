// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    this.success,
    this.token,
    this.user,
  });

  bool? success;
  String? token;
  bool? user;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        success: json["success"],
        token: json["token"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
        "user": user,
      };
}
