// import 'package:customer_app/app/data/models/category_product_model.dart';
// import 'package:customer_app/app/data/models/user_model.dart';

// class ProductModel {
//   int? id;
//   String? name;
//   String? slug;
//   String? image;
//   CategoryProductModel? categoryProductId;
//   String? code;
//   int? stoke;
//   int? stockOut;
//   int? price;
//   String? desc;
//   UserModel? userId;
//   int? isActive;
//   String? createdAt;
//   String? updatedAt;

//   ProductModel(
//       {this.id,
//       this.name,
//       this.slug,
//       this.image,
//       this.categoryProductId,
//       this.code,
//       this.stoke,
//       this.stockOut,
//       this.price,
//       this.desc,
//       this.userId,
//       this.isActive,
//       this.createdAt,
//       this.updatedAt});

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//     categoryProductId = json['category_product_id'] != null
//         ? new CategoryProductModel.fromJson(json['category_product_id'])
//         : null;
//     code = json['code'];
//     stoke = json['stoke'];
//     stoke = json['stoke_out'];
//     price = json['price'];
//     desc = json['desc'];
//     userId = json['user_id'] != null
//         ? new UserModel.fromJson(json['user_id'])
//         : null;
//     isActive = json['is_active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['image'] = this.image;
//     if (this.categoryProductId != null) {
//       data['category_product_id'] = this.categoryProductId!.toJson();
//     }
//     data['code'] = this.code;
//     data['stoke'] = this.stoke;
//     data['price'] = this.price;
//     data['desc'] = this.desc;
//     if (this.userId != null) {
//       data['user_id'] = this.userId!.toJson();
//     }
//     data['is_active'] = this.isActive;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.categoryProductId,
    this.code,
    this.stoke,
    this.weight,
    this.stockOut,
    this.price,
    this.desc,
    this.userId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  dynamic image;
  CategoryProductId? categoryProductId;
  String? code;
  int? stoke;
  int? weight;
  int? stockOut;
  int? price;
  String? desc;
  UserId? userId;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        categoryProductId:
            CategoryProductId.fromJson(json["category_product_id"]),
        code: json["code"],
        stoke: json["stoke"],
        weight: json["weight"],
        stockOut: json["stock_out"],
        price: json["price"],
        desc: json["desc"],
        userId: UserId.fromJson(json["user_id"]),
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "category_product_id": categoryProductId!.toJson(),
        "code": code,
        "stoke": stoke,
        "weight": weight,
        "stock_out": stockOut,
        "price": price,
        "desc": desc,
        "user_id": userId!.toJson(),
        "is_active": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class CategoryProductId {
  CategoryProductId({
    this.id,
    this.name,
    this.slug,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  int? isActive;
  dynamic createdAt;
  dynamic updatedAt;

  factory CategoryProductId.fromJson(Map<String, dynamic> json) =>
      CategoryProductId(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        isActive: json["is_active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class UserId {
  UserId({
    this.id,
    this.name,
    this.email,
  });

  int? id;
  String? name;
  String? email;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
