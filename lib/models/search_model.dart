// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.message,
    required this.status,
    required this.success,
    required this.products,
  });

  String message;
  int status;
  bool success;
  List<Product> products;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    message: json["message"],
    status: json["status"],
    success: json["success"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "success": success,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.productName,
    required this.description,
    required this.status,
    required this.qrCode,
    required this.qrCodeImage,
    required this.createdAt,
    required this.exclusiveStuffy,
    required this.updatedAt,
    required this.images,
  });

  int id;
  int userId;
  int categoryId;
  String productName;
  String description;
  String status;
  String qrCode;
  String qrCodeImage;
  DateTime createdAt;
  int exclusiveStuffy;
  DateTime updatedAt;
  List<Image> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    productName: json["product_name"],
    description: json["Description"],
    status: json["status"],
    qrCode: json["QR_code"],
    qrCodeImage: json["QR_code_image"],
    createdAt: DateTime.parse(json["created_at"]),
    exclusiveStuffy: json["exclusive_stuffy"],
    updatedAt: DateTime.parse(json["Updated_at"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "product_name": productName,
    "Description": description,
    "status": status,
    "QR_code": qrCode,
    "QR_code_image": qrCodeImage,
    "created_at": createdAt.toIso8601String(),
    "exclusive_stuffy": exclusiveStuffy,
    "Updated_at": updatedAt.toIso8601String(),
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
