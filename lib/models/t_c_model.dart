// To parse this JSON data, do
//
//     final tcModel = tcModelFromJson(jsonString);

import 'dart:convert';

TcModel tcModelFromJson(String str) => TcModel.fromJson(json.decode(str));

String tcModelToJson(TcModel data) => json.encode(data.toJson());

class TcModel {
  TcModel({
    required this.message,
    required this.status,
    required this.success,
    required this.terms,
  });

  String message;
  int status;
  bool success;
  String terms;

  factory TcModel.fromJson(Map<String, dynamic> json) => TcModel(
    message: json["message"],
    status: json["status"],
    success: json["success"],
    terms: json["terms"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "success": success,
    "terms": terms,
  };
}
