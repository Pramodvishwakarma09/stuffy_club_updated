class editprofile {
  String? messgae;
  int ?status;
  bool? success;

  editprofile({this.messgae, this.status, this.success});

  editprofile.fromJson(Map<String, dynamic> json) {
    messgae = json['messgae'];
    status = json['status'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messgae'] = this.messgae;
    data['status'] = this.status;
    data['success'] = this.success;
    return data;
  }
}
