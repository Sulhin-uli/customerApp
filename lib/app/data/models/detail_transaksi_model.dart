// To parse this JSON data, do
//
//     final detailTransaksi = detailTransaksiFromJson(jsonString);

import 'dart:convert';

DetailTransaksi detailTransaksiFromJson(String str) =>
    DetailTransaksi.fromJson(json.decode(str));

String detailTransaksiToJson(DetailTransaksi data) =>
    json.encode(data.toJson());

class DetailTransaksi {
  DetailTransaksi({
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
    this.nameBilling,
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
  String? review;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? nameBilling;
  Address? address;
  User? user;
  List<OrderItem>? orderItems;

  factory DetailTransaksi.fromJson(Map<String, dynamic> json) =>
      DetailTransaksi(
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
        nameBilling: json["name_billing"],
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
        "name_billing": nameBilling,
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
    this.provinceId,
    this.cityId,
    this.districtId,
    this.villageId,
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
  dynamic provinceId;
  dynamic cityId;
  dynamic districtId;
  dynamic villageId;
  int? postalCode;
  int? mainAddress;
  String? completeAddress;
  String? noteForCourier;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        recipientsName: json["recipients_name"],
        telp: json["telp"],
        addressLabel: json["address_label"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        districtId: json["district_id"],
        villageId: json["village_id"],
        postalCode: json["postal_code"],
        mainAddress: json["main_address"],
        completeAddress: json["complete_address"],
        noteForCourier: json["note_for_courier"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "recipients_name": recipientsName,
        "telp": telp,
        "address_label": addressLabel,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "village_id": villageId,
        "postal_code": postalCode,
        "main_address": mainAddress,
        "complete_address": completeAddress,
        "note_for_courier": noteForCourier,
        "created_at": createdAt!.toIso8601String(),
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
  ProductId? productId;
  String? qty;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["order_id"],
        productId: ProductId.fromJson(json["product_id"]),
        qty: json["qty"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId!.toJson(),
        "qty": qty,
        "price": price,
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
  String? image;
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
      };
}
