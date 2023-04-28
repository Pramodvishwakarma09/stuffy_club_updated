// To parse this JSON data, do
//
//     final getAllFriendModel = getAllFriendModelFromJson(jsonString);

import 'dart:convert';

GetAllFriendModel getAllFriendModelFromJson(String str) => GetAllFriendModel.fromJson(json.decode(str));

String getAllFriendModelToJson(GetAllFriendModel data) => json.encode(data.toJson());

class GetAllFriendModel {
  String message;
  List<MyFriend> myFriends;
  bool success;
  int status;

  GetAllFriendModel({
    required this.message,
    required this.myFriends,
    required this.success,
    required this.status,
  });

  factory GetAllFriendModel.fromJson(Map<String, dynamic> json) => GetAllFriendModel(
    message: json["message"],
    myFriends: List<MyFriend>.from(json["my_friends"].map((x) => MyFriend.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "my_friends": List<dynamic>.from(myFriends.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class MyFriend {
  int id;
  String fullName;
  String phoneNumber;
  String email;
  String fcmToken;
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
  int deviceType;
  DateTime createdAt;
  DateTime updateAt;

  MyFriend({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.fcmToken,
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
    required this.deviceType,
    required this.createdAt,
    required this.updateAt,
  });

  factory MyFriend.fromJson(Map<String, dynamic> json) => MyFriend(
    id: json["id"],
    fullName: json["full_name"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    fcmToken: json["fcm_token"],
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
    deviceType: json["device_type"],
    createdAt: DateTime.parse(json["created_at"]),
    updateAt: DateTime.parse(json["update_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "phone_number": phoneNumber,
    "email": email,
    "fcm_token": fcmToken,
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
    "device_type": deviceType,
    "created_at": createdAt.toIso8601String(),
    "update_at": updateAt.toIso8601String(),
  };
}
