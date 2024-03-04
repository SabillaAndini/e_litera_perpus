// To parse this JSON data, do
//
//     final resLoginModel = resLoginModelFromJson(jsonString);

import 'dart:convert';

ResLoginModel resLoginModelFromJson(String str) =>
    ResLoginModel.fromJson(json.decode(str));

String resLoginModelToJson(ResLoginModel data) => json.encode(data.toJson());

class ResLoginModel {
  final String? token;

  ResLoginModel({
    this.token,
  });

  factory ResLoginModel.fromJson(Map<String, dynamic> json) => ResLoginModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
