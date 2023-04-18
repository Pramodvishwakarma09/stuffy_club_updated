class Stuff_Profile {
  String? message;
  bool? success;
  int? status;
  List<Stuff_Profile_Responce>? data;

  Stuff_Profile({this.message, this.success, this.status, this.data});

  Stuff_Profile.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Stuff_Profile_Responce>[];
      json['data'].forEach((v) {
        data?.add(new Stuff_Profile_Responce.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stuff_Profile_Responce {
  int? id;
  int? userId;
  int? categoryId;
  String? productName;
  String? productImage;
  String? description;
  String? status;
  String? createdAt;
  int? exclusiveStuffy;

  Stuff_Profile_Responce(
      {this.id,
        this.userId,
        this.categoryId,
        this.productName,
        this.productImage,
        this.description,
        this.status,
        this.createdAt,
        this.exclusiveStuffy});

  Stuff_Profile_Responce.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    description = json['Description'];
    status = json['status'];
    createdAt = json['created_at'];
    exclusiveStuffy = json['exclusive_stuffy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['Description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['exclusive_stuffy'] = this.exclusiveStuffy;
    return data;
  }
}
