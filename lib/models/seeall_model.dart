// To parse this JSON data, do
//
//     final seealllModel = seealllModelFromJson(jsonString);

import 'dart:convert';

SeealllModel seealllModelFromJson(String str) => SeealllModel.fromJson(json.decode(str));

String seealllModelToJson(SeealllModel data) => json.encode(data.toJson());

class SeealllModel {
  SeealllModel({
    required this.message,
    required this.response,
    required this.success,
    required this.status,
  });

  String message;
  List<Response> response;
  bool success;
  int status;

  factory SeealllModel.fromJson(Map<String, dynamic> json) => SeealllModel(
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
  Status status;
  String qrCode;
  String qrCodeImage;
  DateTime createdAt;
  int exclusiveStuffy;
  DateTime updatedAt;
  List<Images> images;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
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
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
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

enum Status { PUBLIC }

final statusValues = EnumValues({
  "public": Status.PUBLIC
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
