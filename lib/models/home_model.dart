// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.message,
    required this.status,
    required this.success,
    required this.categories,
    required this.exclusiveStuffy,
    required this.newestStuffy,
  });

  String message;
  int status;
  bool success;
  List<Category> categories;
  List<Stuffy> exclusiveStuffy;
  List<Stuffy> newestStuffy;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    message: json["message"],
    status: json["status"],
    success: json["success"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    exclusiveStuffy: List<Stuffy>.from(json["exclusive_stuffy"].map((x) => Stuffy.fromJson(x))),
    newestStuffy: List<Stuffy>.from(json["newest_stuffy"].map((x) => Stuffy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "success": success,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "exclusive_stuffy": List<dynamic>.from(exclusiveStuffy.map((x) => x.toJson())),
    "newest_stuffy": List<dynamic>.from(newestStuffy.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.categoryName,
    required this.image,
    required this.createdAt,
  });

  int id;
  String categoryName;
  String image;
  DateTime createdAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryName: json["category_name"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "image": image,
    "created_at": createdAt.toIso8601String(),
  };
}

class Stuffy {
  Stuffy({
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
  List<Images> images;

  factory Stuffy.fromJson(Map<String, dynamic> json) => Stuffy(
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
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
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

class Images {
  Images({
    required this.imageNames,
  });

  String imageNames;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    imageNames: json["Image_names"],
  );

  Map<String, dynamic> toJson() => {
    "Image_names": imageNames,
  };
}
