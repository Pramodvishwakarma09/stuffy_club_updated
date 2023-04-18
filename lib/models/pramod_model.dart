// To parse this JSON data, do
//
//     final pramodModel = pramodModelFromJson(jsonString);

import 'dart:convert';

PramodModel pramodModelFromJson(String str) => PramodModel.fromJson(json.decode(str));

String pramodModelToJson(PramodModel data) => json.encode(data.toJson());

class PramodModel {
  PramodModel({
    required this.message,
    required this.response,
    required this.success,
    required this.status,
  });

  String message;
  List<Response> response;
  bool success;
  int status;

  factory PramodModel.fromJson(Map<String, dynamic> json) => PramodModel(
    message: json["message"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Response {
  Response({
    required this.productName,
    required this.productId,
    required this.description,
    required this.status,
    required this.qrCode,
    required this.qrCodeImage,
    required this.images,
  });

  String productName;
  int productId;
  String description;
  String status;
  String qrCode;
  String qrCodeImage;
  List<Image> images;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    productName: json["product_name"],
    productId: json["product_id"],
    description: json["Description"],
    status: json["status"],
    qrCode: json["QR_code"],
    qrCodeImage: json["QR_code_image"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "product_id": productId,
    "Description": description,
    "status": status,
    "QR_code": qrCode,
    "QR_code_image": qrCodeImage,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  Image({
    required this.imageNames,
  });

  String imageNames;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    imageNames: json["Image_names"],
  );

  Map<String, dynamic> toJson() => {
    "Image_names": imageNames,
  };
}
