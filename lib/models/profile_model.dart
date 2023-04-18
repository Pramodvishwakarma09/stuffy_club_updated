// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.status,
    required this.success,
    required this.message,
    required this.profileImage,
    required this.data,
  });

  int status;
  bool success;
  String message;
  String profileImage;
  List<Datumaaa> data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    profileImage: json["profile_image"],
    data: List<Datumaaa>.from(json["data"].map((x) => Datumaaa.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "profile_image": profileImage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datumaaa {
  Datumaaa({
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
    this.deviceToken,
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
  dynamic deviceToken;
  int blockDevice;
  String fcmToken;
  int deviceType;
  DateTime createdAt;
  DateTime updateAt;

  factory Datumaaa.fromJson(Map<String, dynamic> json) => Datumaaa(
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
    deviceToken: json["device_token"],
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
    "device_token": deviceToken,
    "block_device": blockDevice,
    "fcm_token": fcmToken,
    "device_type": deviceType,
    "created_at": createdAt.toIso8601String(),
    "update_at": updateAt.toIso8601String(),
  };
}
