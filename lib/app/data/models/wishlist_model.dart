import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';

class WishlistModel {
  int? id;
  UserModel? userId;
  ProductModel? productId;
  String? createdAt;
  String? updatedAt;

  WishlistModel(
      {this.id, this.userId, this.productId, this.createdAt, this.updatedAt});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] != null
        ? new UserModel.fromJson(json['user_id'])
        : null;
    productId = json['product_id'] != null
        ? new ProductModel.fromJson(json['product_id'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    if (this.productId != null) {
      data['product_id'] = this.productId!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
