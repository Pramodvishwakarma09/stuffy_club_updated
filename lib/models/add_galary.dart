// To parse this JSON data, do
//
//     final addGallryModel = addGallryModelFromJson(jsonString);

import 'dart:convert';

AddGallryModel addGallryModelFromJson(String str) => AddGallryModel.fromJson(json.decode(str));

String addGallryModelToJson(AddGallryModel data) => json.encode(data.toJson());

class AddGallryModel {
  AddGallryModel({
    required this.message,
    required this.success,
    required this.status,
  });

  String message;
  bool success;
  int status;

  factory AddGallryModel.fromJson(Map<String, dynamic> json) => AddGallryModel(
    message: json["message"],
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "status": status,
  };
}
