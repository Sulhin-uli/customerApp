// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

// import 'dart:convert';

// CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

// String cartModelToJson(CartModel data) => json.encode(data.toJson());

// class CartModel {
//   CartModel({
//     this.id,
//     this.name,
//     this.slug,
//     this.categoryProductId,
//     this.code,
//     this.stoke,
//     this.stockOut,
//     this.price,
//     this.desc,
//     this.userId,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   String? name;
//   String? slug;
//   CategoryProductId? categoryProductId;
//   String? code;
//   int? stoke;
//   dynamic? stockOut;
//   int? price;
//   String? desc;
//   UserId? userId;
//   int? isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         categoryProductId:
//             CategoryProductId.fromJson(json["category_product_id"]),
//         code: json["code"],
//         stoke: json["stoke"],
//         stockOut: json["stock_out"],
//         price: json["price"],
//         desc: json["desc"],
//         userId: UserId.fromJson(json["user_id"]),
//         isActive: json["is_active"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "category_product_id": categoryProductId!.toJson(),
//         "code": code,
//         "stoke": stoke,
//         "stock_out": stockOut,
//         "price": price,
//         "desc": desc,
//         "user_id": userId!.toJson(),
//         "is_active": isActive,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//       };
// }

// class CategoryProductId {
//   CategoryProductId({
//     this.id,
//     this.name,
//     this.slug,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   String? name;
//   String? slug;
//   int? isActive;
//   dynamic createdAt;
//   dynamic updatedAt;

//   factory CategoryProductId.fromJson(Map<String, dynamic> json) =>
//       CategoryProductId(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         isActive: json["is_active"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "is_active": isActive,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }

// class UserId {
//   UserId({
//     this.id,
//     this.name,
//     this.email,
//   });

//   int? id;
//   String? name;
//   String? email;

//   factory UserId.fromJson(Map<String, dynamic> json) => UserId(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//       };
// }

// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.id,
    this.isMark,
    this.userId,
    this.productId,
    this.productQty,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  bool? isMark;
  UserId? userId;
  ProductId? productId;
  int? productQty;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        isMark: false,
        userId: UserId.fromJson(json["user_id"]),
        productId: ProductId.fromJson(json["product_id"]),
        productQty: json["product_qty"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId!.toJson(),
        "product_id": productId!.toJson(),
        "product_qty": productQty,
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
