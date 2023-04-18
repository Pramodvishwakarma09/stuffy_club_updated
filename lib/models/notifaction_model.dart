// To parse this JSON data, do
//
//     final notoficationModel = notoficationModelFromJson(jsonString);

import 'dart:convert';

NotoficationModel notoficationModelFromJson(String str) => NotoficationModel.fromJson(json.decode(str));

String notoficationModelToJson(NotoficationModel data) => json.encode(data.toJson());

class NotoficationModel {
  NotoficationModel({
    required this.message,
    required this.response,
    required this.success,
    required this.status,
  });

  String message;
  List<Response> response;
  bool success;
  int status;

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
  Response({
    required this.id,
    required this.userId,
    required this.body,
    required this.notificationType,
    required this.createdAt,
  });

  int id;
  int userId;
  String body;
  String notificationType;
  DateTime createdAt;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    userId: json["user_id"],
    body: json["body"],
    notificationType: json["notification_type"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "body": body,
    "notification_type": notificationType,
    "created_at": createdAt.toIso8601String(),
  };
}
