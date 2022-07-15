// To parse this JSON data, do
//
//     final checkout = checkoutFromJson(jsonString);

import 'dart:convert';

Checkout checkoutFromJson(String str) => Checkout.fromJson(json.decode(str));

String checkoutToJson(Checkout data) => json.encode(data.toJson());

class Checkout {
  Checkout({
    this.id,
    this.userId,
    this.addressId,
    this.code,
    this.status,
    this.orderDate,
    this.paymentDue,
    this.paymentStatus,
    this.paymentToken,
    this.paymentUrl,
    this.totalPrice,
    this.approvedBy,
    this.approvedAt,
    this.cancelledBy,
    this.cancelledAt,
    this.cancellationNote,
    this.review,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.user,
    this.orderItems,
  });

  int? id;
  int? userId;
  int? addressId;
  String? code;
  String? status;
  DateTime? orderDate;
  DateTime? paymentDue;
  String? paymentStatus;
  String? paymentToken;
  String? paymentUrl;
  int? totalPrice;
  dynamic approvedBy;
  dynamic approvedAt;
  dynamic cancelledBy;
  dynamic cancelledAt;
  dynamic cancellationNote;
  dynamic review;
  DateTime? createdAt;
  DateTime? updatedAt;
  Address? address;
  User? user;
  List<OrderItem>? orderItems;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        id: json["id"],
        userId: json["user_id"],
        addressId: json["address_id"],
        code: json["code"],
        status: json["status"],
        orderDate: DateTime.parse(json["order_date"]),
        paymentDue: DateTime.parse(json["payment_due"]),
        paymentStatus: json["payment_status"],
        paymentToken: json["payment_token"],
        paymentUrl: json["payment_url"],
        totalPrice: json["total_price"],
        approvedBy: json["approved_by"],
        approvedAt: json["approved_at"],
        cancelledBy: json["cancelled_by"],
        cancelledAt: json["cancelled_at"],
        cancellationNote: json["cancellation_note"],
        review: json["review"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        address: Address.fromJson(json["address"]),
        user: User.fromJson(json["user"]),
        orderItems: List<OrderItem>.from(
            json["order_items"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "address_id": addressId,
        "code": code,
        "status": status,
        "order_date": orderDate!.toIso8601String(),
        "payment_due": paymentDue!.toIso8601String(),
        "payment_status": paymentStatus,
        "payment_token": paymentToken,
        "payment_url": paymentUrl,
        "total_price": totalPrice,
        "approved_by": approvedBy,
        "approved_at": approvedAt,
        "cancelled_by": cancelledBy,
        "cancelled_at": cancelledAt,
        "cancellation_note": cancellationNote,
        "review": review,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "address": address!.toJson(),
        "user": user!.toJson(),
        "order_items": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.id,
    this.userId,
    this.recipientsName,
    this.telp,
    this.addressLabel,
    this.city,
    this.postalCode,
    this.mainAddress,
    this.completeAddress,
    this.noteForCourier,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? recipientsName;
  String? telp;
  String? addressLabel;
  String? city;
  int? postalCode;
  int? mainAddress;
  String? completeAddress;
  String? noteForCourier;
  dynamic createdAt;
  DateTime? updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        recipientsName: json["recipients_name"],
        telp: json["telp"],
        addressLabel: json["address_label"],
        city: json["city"],
        postalCode: json["postal_code"],
        mainAddress: json["main_address"],
        completeAddress: json["complete_address"],
        noteForCourier: json["note_for_courier"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "recipients_name": recipientsName,
        "telp": telp,
        "address_label": addressLabel,
        "city": city,
        "postal_code": postalCode,
        "main_address": mainAddress,
        "complete_address": completeAddress,
        "note_for_courier": noteForCourier,
        "created_at": createdAt,
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class OrderItem {
  OrderItem({
    this.id,
    this.orderId,
    this.productId,
    this.qty,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? orderId;
  String? productId;
  String? qty;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        qty: json["qty"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "qty": qty,
        "price": price,
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
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "is_email_verified": isEmailVerified,
      };
}
