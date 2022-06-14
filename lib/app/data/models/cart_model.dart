import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';

class CartModel {
  int? id;
  bool? isMark;
  UserModel? userId;
  ProductModel? productId;
  int? productQty;
  int? sessionId;
  String? createdAt;
  String? updatedAt;

  CartModel(
      {this.id,
      this.isMark,
      this.userId,
      this.productId,
      this.productQty,
      this.sessionId,
      this.createdAt,
      this.updatedAt});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isMark = json['isMark'];
    userId = json['user_id'] != null
        ? new UserModel.fromJson(json['user_id'])
        : null;
    productQty = json['product_qty'];
    productId = json['product_id'] != null
        ? new ProductModel.fromJson(json['product_id'])
        : null;
    sessionId = json['session_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isMark'] = this.isMark;
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    data['product_qty'] = this.productQty;
    if (this.productId != null) {
      data['product_id'] = this.productId!.toJson();
    }
    data['session_id'] = this.sessionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
