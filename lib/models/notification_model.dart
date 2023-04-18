class Notification_model {
  String? message;
  List<Response>? response;
  bool? success;
  int? status;

  Notification_model({this.message, this.response, this.success, this.status});

  Notification_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['Response'] != null) {
      response = <Response>[];
      json['Response'].forEach((v) {
        response!.add(new Response.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.response != null) {
      data['Response'] = this.response!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class Response {
  int? id;
  int? userId;
  String? body;
  String? notificationType;
  String? createdAt;

  Response(
      {this.id, this.userId, this.body, this.notificationType, this.createdAt});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    body = json['body'];
    notificationType = json['notification_type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['body'] = this.body;
    data['notification_type'] = this.notificationType;
    data['created_at'] = this.createdAt;
    return data;
  }
}
