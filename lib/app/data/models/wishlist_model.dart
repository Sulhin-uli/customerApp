// import 'package:customer_app/app/data/models/product_model.dart';
// import 'package:customer_app/app/data/models/user_model.dart';

// class WishlistModel {
//   int? id;
//   UserModel? userId;
//   ProductModel? productId;
//   String? createdAt;
//   String? updatedAt;

//   WishlistModel(
//       {this.id, this.userId, this.productId, this.createdAt, this.updatedAt});

//   WishlistModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'] != null
//         ? new UserModel.fromJson(json['user_id'])
//         : null;
//     productId = json['product_id'] != null
//         ? new ProductModel.fromJson(json['product_id'])
//         : null;
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.userId != null) {
//       data['user_id'] = this.userId!.toJson();
//     }
//     if (this.productId != null) {
//       data['product_id'] = this.productId!.toJson();
//     }
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final wishlistModel = wishlistModelFromJson(jsonString);

import 'dart:convert';

WishlistModel wishlistModelFromJson(String str) =>
    WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
  WishlistModel({
    this.id,
    this.userId,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  UserId? userId;
  ProductId? productId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        id: json["id"],
        userId: UserId.fromJson(json["user_id"]),
        productId: ProductId.fromJson(json["product_id"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId!.toJson(),
        "product_id": productId!.toJson(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class ProductId {
  ProductId({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.categoryProductId,
    this.code,
    this.stoke,
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
  dynamic stockOut;
  int? price;
  String? desc;
  UserId? userId;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        categoryProductId:
            CategoryProductId.fromJson(json["category_product_id"]),
        code: json["code"],
        stoke: json["stoke"],
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
