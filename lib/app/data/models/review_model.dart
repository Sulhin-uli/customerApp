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
  });

  int? id;
  int? userId;
  int? orderId;
  int? productId;
  String? starsRated;
  String? review;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        starsRated: json["stars_rated"],
        review: json["review"] == null ? null : json["review"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "product_id": productId,
        "stars_rated": starsRated,
        "review": review == null ? null : review,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
