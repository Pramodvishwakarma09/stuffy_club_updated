class Add_stuffy_model {
  String? message;
  int? status;
  bool? success;

  Add_stuffy_model({this.message, this.status, this.success});

  Add_stuffy_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    return data;
  }
}
