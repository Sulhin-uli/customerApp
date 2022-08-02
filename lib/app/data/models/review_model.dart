// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'dart:convert';

List<Review> reviewFromJson(String str) =>
    List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

String reviewToJson(List<Review> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
  Review({
    this.id,
    this.userId,
    this.orderId,
    this.productId,
    this.starsRated,
    this.review,
    this.createdAt,
    this.updatedAt,
    this.nameReviewer,
    this.user,
    this.product,
  });

  int? id;
  int? userId;
  int? orderId;
  int? productId;
  String? starsRated;
  String? review;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? nameReviewer;
  User? user;
  Product? product;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        starsRated: json["stars_rated"],
        review: json["review"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        nameReviewer: json["name_reviewer"],
        // user: User.fromJson(json["user"]),
        // product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "product_id": productId,
        "stars_rated": starsRated,
        "review": review,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "name_reviewer": nameReviewer,
        "user": user!.toJson(),
        "product": product!.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.categoryProductId,
    this.userId,
    this.name,
    this.slug,
    this.image,
    this.code,
    this.stoke,
    this.stockOut,
    this.price,
    this.desc,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? categoryProductId;
  int? userId;
  String? name;
  String? slug;
  dynamic image;
  String? code;
  int? stoke;
  int? stockOut;
  int? price;
  String? desc;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryProductId: json["category_product_id"],
        userId: json["user_id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        code: json["code"],
        stoke: json["stoke"],
        stockOut: json["stock_out"] == null ? null : json["stock_out"],
        price: json["price"],
        desc: json["desc"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_product_id": categoryProductId,
        "user_id": userId,
        "name": name,
        "slug": slug,
        "image": image,
        "code": code,
        "stoke": stoke,
        "stock_out": stockOut == null ? null : stockOut,
        "price": price,
        "desc": desc,
        "is_active": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.token,
    this.tokenExpire,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.isEmailVerified,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic token;
  dynamic tokenExpire;
  dynamic fcmToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isEmailVerified;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        token: json["token"],
        tokenExpire: json["token_expire"],
        fcmToken: json["fcm_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isEmailVerified: json["is_email_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "token": token,
        "token_expire": tokenExpire,
        "fcm_token": fcmToken,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "is_email_verified": isEmailVerified,
      };
}
