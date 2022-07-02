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
    userId =
        json['user_id'] != null ? UserModel.fromJson(json['user_id']) : null;
    productQty = json['product_qty'];
    productId = json['product_id'] != null
        ? ProductModel.fromJson(json['product_id'])
        : null;
    sessionId = json['session_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['isMark'] = isMark;
    if (userId != null) {
      data['user_id'] = userId!.toJson();
    }
    data['product_qty'] = productQty;
    if (productId != null) {
      data['product_id'] = productId!.toJson();
    }
    data['session_id'] = sessionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
