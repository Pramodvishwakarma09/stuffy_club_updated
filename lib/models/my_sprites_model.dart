// To parse this JSON data, do
//
//     final getSpritesModel = getSpritesModelFromJson(jsonString);

import 'dart:convert';

GetSpritesModel getSpritesModelFromJson(String str) => GetSpritesModel.fromJson(json.decode(str));

String getSpritesModelToJson(GetSpritesModel data) => json.encode(data.toJson());

class GetSpritesModel {
  GetSpritesModel({
    required this.message,
    required this.response,
    required this.images,
    required this.success,
    required this.status,
  });

  String message;
  List<Response> response;
  List<Image1> images;
  bool success;
  int status;

  factory GetSpritesModel.fromJson(Map<String, dynamic> json) => GetSpritesModel(
    message: json["message"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    images: List<Image1>.from(json["images"].map((x) => Image1.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Image1 {
  Image1({
    required this.imageNames,
  });

  String imageNames;

  factory Image1.fromJson(Map<String, dynamic> json) => Image1(
    imageNames: json["Image_names"],
  );

  Map<String, dynamic> toJson() => {
    "Image_names": imageNames,
  };
}

class Response {
  Response({
    required this.productName,
    required this.productId,
    required this.images,
  });

  String productName;
  int productId;
  List<Image1> images;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    productName: json["product_name"],
    productId: json["product_id"],
    images: List<Image1>.from(json["images"].map((x) => Image1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "product_id": productId,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}
