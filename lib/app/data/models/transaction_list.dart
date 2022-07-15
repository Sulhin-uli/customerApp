// To parse this JSON data, do
//
//     final transactionList = transactionListFromJson(jsonString);

import 'dart:convert';

TransactionList transactionListFromJson(String str) =>
    TransactionList.fromJson(json.decode(str));

String transactionListToJson(TransactionList data) =>
    json.encode(data.toJson());

class TransactionList {
  TransactionList({
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
  String? nameBilling;

  factory TransactionList.fromJson(Map<String, dynamic> json) =>
      TransactionList(
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "address_id": addressId,
        "code": code,
        "status": status,
        "order_date": orderDate,
        "payment_due": paymentDue,
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "name_billing": nameBilling,
      };
}
