import 'dart:convert';


NotoficationModel notoficationModelFromJson(String str) => NotoficationModel.fromJson(json.decode(str));
String notoficationModelToJson(NotoficationModel data) => json.encode(data.toJson());

class NotoficationModel {
  String message;
  List<Response> response;
  bool success;
  int status;

  NotoficationModel({
    required this.message,
    required this.response,
    required this.success,
    required this.status,
  });

  factory NotoficationModel.fromJson(Map<String, dynamic> json) => NotoficationModel(
    message: json["message"],
    response: List<Response>.from(json["Response"].map((x) => Response.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "Response": List<dynamic>.from(response.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Response {
  int id;
  int userId;
  String body;
  String notificationType;
  int galleryId;
  int? senderId;
  int? reciverId;
  int friendRequestStatus;
  DateTime createdAt;

  Response({
    required this.id,
    required this.userId,
    required this.body,
    required this.notificationType,
    required this.galleryId,
    this.senderId,
    this.reciverId,
    required this.friendRequestStatus,
    required this.createdAt,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    userId: json["user_id"],
    body: json["body"],
    notificationType: json["notification_type"],
    galleryId: json["gallery_id"],
    senderId: json["sender_id"],
    reciverId: json["reciver_id"],
    friendRequestStatus: json["friend_request_status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "body": body,
    "notification_type": notificationType,
    "gallery_id": galleryId,
    "sender_id": senderId,
    "reciver_id": reciverId,
    "friend_request_status": friendRequestStatus,
    "created_at": createdAt.toIso8601String(),
  };
}
