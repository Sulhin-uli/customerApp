import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';

class ProductModel {
  int? id;
  String? name;
  String? slug;
  String? image;
  CategoryProductModel? categoryProductId;
  String? code;
  int? stoke;
  int? price;
  String? desc;
  UserModel? userId;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  ProductModel(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.categoryProductId,
      this.code,
      this.stoke,
      this.price,
      this.desc,
      this.userId,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    categoryProductId = json['category_product_id'] != null
        ? new CategoryProductModel.fromJson(json['category_product_id'])
        : null;
    code = json['code'];
    stoke = json['stoke'];
    price = json['price'];
    desc = json['desc'];
    userId = json['user_id'] != null
        ? new UserModel.fromJson(json['user_id'])
        : null;
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    if (this.categoryProductId != null) {
      data['category_product_id'] = this.categoryProductId!.toJson();
    }
    data['code'] = this.code;
    data['stoke'] = this.stoke;
    data['price'] = this.price;
    data['desc'] = this.desc;
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
