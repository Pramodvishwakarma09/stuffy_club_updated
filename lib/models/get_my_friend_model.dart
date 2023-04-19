// To parse this JSON data, do
//
//     final getMyFriendModel = getMyFriendModelFromJson(jsonString);

import 'dart:convert';

GetMyFriendModel getMyFriendModelFromJson(String str) => GetMyFriendModel.fromJson(json.decode(str));

String getMyFriendModelToJson(GetMyFriendModel data) => json.encode(data.toJson());

class GetMyFriendModel {
  GetMyFriendModel({
    required this.message,
    required this.myFriends,
    required this.success,
    required this.status,
  });

  String message;
  List<MyFriend> myFriends;
  bool success;
  int status;

  factory GetMyFriendModel.fromJson(Map<String, dynamic> json) => GetMyFriendModel(
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
  MyFriend({
    required this.friendId,
    required this.friendName,
    required this.profileImage,
  });

  int friendId;
  String friendName;
  String profileImage;

  factory MyFriend.fromJson(Map<String, dynamic> json) => MyFriend(
    friendId: json["friend_id"],
    friendName: json["friend_name"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "friend_id": friendId,
    "friend_name": friendName,
    "profile_image": profileImage,
  };
}
