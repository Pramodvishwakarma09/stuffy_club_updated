class Grid_view_model {
  String? message;
  bool? success;
  int? status;
  List<Data>? data;

  Grid_view_model({this.message, this.success, this.status, this.data});

  Grid_view_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  int? userId;
  int? categoryId;
  String? productName;
  String? description;
  String? status;
  String? qRcode;
  String? qRCodeImage;
  String? createdAt;
  int? exclusiveStuffy;
  List<Images>? images;

  Data(
      {this.id,
        this.userId,
        this.categoryId,
        this.productName,
        this.description,
        this.status,
        this.qRcode,
        this.qRCodeImage,
        this.createdAt,
        this.exclusiveStuffy,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    productName = json['product_name'];
    description = json['Description'];
    status = json['status'];
    qRcode = json['QRcode'];
    qRCodeImage = json['QR_code_image'];
    createdAt = json['created_at'];
    exclusiveStuffy = json['exclusive_stuffy'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['product_name'] = this.productName;
    data['Description'] = this.description;
    data['status'] = this.status;
    data['QRcode'] = this.qRcode;
    data['QR_code_image'] = this.qRCodeImage;
    data['created_at'] = this.createdAt;
    data['exclusive_stuffy'] = this.exclusiveStuffy;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? imageNames;

  Images({this.imageNames});

  Images.fromJson(Map<String, dynamic> json) {
    imageNames = json['Image_names'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Image_names'] = this.imageNames;
    return data;
  }
}
