// To parse this JSON data, do
//
//     final myStuffyModel = myStuffyModelFromJson(jsonString);

import 'dart:convert';

MyStuffyModel myStuffyModelFromJson(String str) => MyStuffyModel.fromJson(json.decode(str));

String myStuffyModelToJson(MyStuffyModel data) => json.encode(data.toJson());

class MyStuffyModel {
  MyStuffyModel({
    required this.message,
    required this.success,
    required this.status,
    required this.data,
  });

  String message;
  bool success;
  int status;
  List<Datum> data;

  factory MyStuffyModel.fromJson(Map<String, dynamic> json) => MyStuffyModel(
    message: json["message"],
    success: json["success"],
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.productName,
    required this.description,
    required this.status,
    required this.qrCode,
    this.qrCodeImage,
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
  Status status;
  String qrCode;
  String? qrCodeImage;
  DateTime createdAt;
  int exclusiveStuffy;
  DateTime updatedAt;
  List<Image> images;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    productName: json["product_name"],
    description: json["Description"],
    status: statusValues.map[json["status"]]!,
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
    "status": statusValues.reverse[status],
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

enum Status { PUBLIC, STATUS_PUBLIC, PRIVATE }

final statusValues = EnumValues({
  "Private": Status.PRIVATE,
  "public": Status.PUBLIC,
  "Public": Status.STATUS_PUBLIC
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
