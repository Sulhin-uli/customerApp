class Order {
  int? id;
  int? userId;
  int? addressId;
  String? code;
  String? status;
  String? orderDate;
  String? paymentDue;
  String? paymentStatus;
  String? paymentToken;
  String? paymentUrl;
  int? totalPrice;
  dynamic approvedBy;
  dynamic approvedAt;
  dynamic cancelledBy;
  dynamic cancelledAt;
  dynamic cancellationNote;
  String? createdAt;
  String? updatedAt;
  Address? address;
  User? user;
  List<OrderItems>? orderItems;

  Order(
      {this.id,
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
      this.createdAt,
      this.updatedAt,
      this.address,
      this.user,
      this.orderItems});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    code = json['code'];
    status = json['status'];
    orderDate = json['order_date'];
    paymentDue = json['payment_due'];
    paymentStatus = json['payment_status'];
    paymentToken = json['payment_token'];
    paymentUrl = json['payment_url'];
    totalPrice = json['total_price'];
    approvedBy = json['approved_by'];
    approvedAt = json['approved_at'];
    cancelledBy = json['cancelled_by'];
    cancelledAt = json['cancelled_at'];
    cancellationNote = json['cancellation_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address =
        json['address'] != null ? Address?.fromJson(json['address']) : null;
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems?.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['address_id'] = addressId;
    data['code'] = code;
    data['status'] = status;
    data['order_date'] = orderDate;
    data['payment_due'] = paymentDue;
    data['payment_status'] = paymentStatus;
    data['payment_token'] = paymentToken;
    data['payment_url'] = paymentUrl;
    data['total_price'] = totalPrice;
    data['approved_by'] = approvedBy;
    data['approved_at'] = approvedAt;
    data['cancelled_by'] = cancelledBy;
    data['cancelled_at'] = cancelledAt;
    data['cancellation_note'] = cancellationNote;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (address != null) {
      data['address'] = address?.toJson();
    }
    if (user != null) {
      data['user'] = user?.toJson();
    }
    if (orderItems != null) {
      data['order_items'] = orderItems?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
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
  String? updatedAt;

  Address(
      {this.id,
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
      this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    recipientsName = json['recipients_name'];
    telp = json['telp'];
    addressLabel = json['address_label'];
    city = json['city'];
    postalCode = json['postal_code'];
    mainAddress = json['main_address'];
    completeAddress = json['complete_address'];
    noteForCourier = json['note_for_courier'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['recipients_name'] = recipientsName;
    data['telp'] = telp;
    data['address_label'] = addressLabel;
    data['city'] = city;
    data['postal_code'] = postalCode;
    data['main_address'] = mainAddress;
    data['complete_address'] = completeAddress;
    data['note_for_courier'] = noteForCourier;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic token;
  dynamic tokenExpire;
  String? createdAt;
  String? updatedAt;
  int? isEmailVerified;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.token,
      this.tokenExpire,
      this.createdAt,
      this.updatedAt,
      this.isEmailVerified});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    token = json['token'];
    tokenExpire = json['token_expire'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isEmailVerified = json['is_email_verified'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['token'] = token;
    data['token_expire'] = tokenExpire;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_email_verified'] = isEmailVerified;
    return data;
  }
}

class OrderItems {
  int? id;
  String? orderId;
  String? productId;
  String? qty;
  String? price;
  String? createdAt;
  String? updatedAt;

  OrderItems(
      {this.id,
      this.orderId,
      this.productId,
      this.qty,
      this.price,
      this.createdAt,
      this.updatedAt});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    qty = json['qty'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['product_id'] = productId;
    data['qty'] = qty;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
