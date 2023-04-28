// To parse this JSON data, do
//
//     final friendRequestModel = friendRequestModelFromJson(jsonString);

import 'dart:convert';

FriendRequestModel friendRequestModelFromJson(String str) => FriendRequestModel.fromJson(json.decode(str));
String friendRequestModelToJson(FriendRequestModel data) => json.encode(data.toJson());

class FriendRequestModel {
  String message;
  bool success;
  int status;
  List<FriendList> friendList;

  FriendRequestModel({
    required this.message,
    required this.success,
    required this.status,
    required this.friendList,
  });

  factory FriendRequestModel.fromJson(Map<String, dynamic> json) => FriendRequestModel(
    message: json["message"],
    success: json["success"],
    status: json["status"],
    friendList: List<FriendList>.from(json["friend_list"].map((x) => FriendList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "status": status,
    "friend_list": List<dynamic>.from(friendList.map((x) => x.toJson())),
  };
}

class FriendList {
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
  int isFriends;

  FriendList({
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
    required this.isFriends,
  });

  factory FriendList.fromJson(Map<String, dynamic> json) => FriendList(
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
    isFriends: json["is_friends"],
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
    "is_friends": isFriends,
  };
}
