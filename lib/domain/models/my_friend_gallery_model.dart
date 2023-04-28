// To parse this JSON data, do
//
//     final myFriendGalleryModel = myFriendGalleryModelFromJson(jsonString);

import 'dart:convert';

MyFriendGalleryModel myFriendGalleryModelFromJson(String str) => MyFriendGalleryModel.fromJson(json.decode(str));

String myFriendGalleryModelToJson(MyFriendGalleryModel data) => json.encode(data.toJson());

class MyFriendGalleryModel {
  MyFriendGalleryModel({
    required this.message,
    required this.response,
    required this.success,
    required this.status,
  });

  String message;
  List<Response> response;
  bool success;
  int status;

  factory MyFriendGalleryModel.fromJson(Map<String, dynamic> json) => MyFriendGalleryModel(
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
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.showPassword,
    required this.profileImage,
    required this.verifyUser,
    required this.qrCodeImage,
    required this.qrCode,
    required this.membershipPlan,
    required this.status,
    required this.token,
    required this.actToken,
    required this.blockDevice,
    required this.fcmToken,
    required this.deviceType,
    required this.createdAt,
    required this.updateAt,
  });

  int id;
  String fullName;
  String phoneNumber;
  String email;
  String password;
  String showPassword;
  String profileImage;
  int verifyUser;
  String qrCodeImage;
  String qrCode;
  int membershipPlan;
  String status;
  String token;
  String actToken;
  int blockDevice;
  String fcmToken;
  int deviceType;
  DateTime createdAt;
  DateTime updateAt;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    fullName: json["full_name"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    password: json["password"],
    showPassword: json["show_password"],
    profileImage: json["profile_image"],
    verifyUser: json["verify_user"],
    qrCodeImage: json["QR_code_image"],
    qrCode: json["QR_code"],
    membershipPlan: json["Membership_Plan"],
    status: json["status"],
    token: json["token"],
    actToken: json["act_token"],
    blockDevice: json["block_device"],
    fcmToken: json["fcm_token"],
    deviceType: json["device_type"],
    createdAt: DateTime.parse(json["created_at"]),
    updateAt: DateTime.parse(json["update_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "phone_number": phoneNumber,
    "email": email,
    "password": password,
    "show_password": showPassword,
    "profile_image": profileImage,
    "verify_user": verifyUser,
    "QR_code_image": qrCodeImage,
    "QR_code": qrCode,
    "Membership_Plan": membershipPlan,
    "status": status,
    "token": token,
    "act_token": actToken,
    "block_device": blockDevice,
    "fcm_token": fcmToken,
    "device_type": deviceType,
    "created_at": createdAt.toIso8601String(),
    "update_at": updateAt.toIso8601String(),
  };
}
