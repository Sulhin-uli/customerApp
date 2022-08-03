// import 'package:customer_app/app/data/models/product_model.dart';

// class PhotoProduct {
//   int? id;
//   ProductModel? productId;
//   String? name;
//   String? createdAt;
//   String? updatedAt;

//   PhotoProduct(
//       {this.id, this.productId, this.name, this.createdAt, this.updatedAt});

//   PhotoProduct.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'] != null
//         ? ProductModel?.fromJson(json['product_id'])
//         : null;
//     name = json['name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     if (productId != null) {
//       data['product_id'] = productId?.toJson();
//     }
//     data['name'] = name;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }

//   static List<PhotoProduct> fromJsonList(List data) {
//     if (data.isEmpty) return [];
//     return data.map((e) => PhotoProduct.fromJson(e)).toList();
//   }

//   @override
//   String toString() => name!;
// }

// To parse this JSON data, do
//
//     final photoProduct = photoProductFromJson(jsonString);

import 'dart:convert';

PhotoProduct photoProductFromJson(String str) =>
    PhotoProduct.fromJson(json.decode(str));

String photoProductToJson(PhotoProduct data) => json.encode(data.toJson());

class PhotoProduct {
  PhotoProduct({
    this.id,
    this.productId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  ProductId? productId;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PhotoProduct.fromJson(Map<String, dynamic> json) => PhotoProduct(
        id: json["id"],
        productId: ProductId.fromJson(json["product_id"]),
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId!.toJson(),
        "name": name,
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
