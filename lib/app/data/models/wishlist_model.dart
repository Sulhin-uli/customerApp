class WishlistModel {
  int? id;
  UserId? userId;
  ProductId? productId;
  String? createdAt;
  String? updatedAt;

  WishlistModel(
      {this.id, this.userId, this.productId, this.createdAt, this.updatedAt});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId =
        json['user_id'] != null ? new UserId.fromJson(json['user_id']) : null;
    productId = json['product_id'] != null
        ? new ProductId.fromJson(json['product_id'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    if (this.productId != null) {
      data['product_id'] = this.productId!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UserId {
  int? id;
  String? name;

  UserId({this.id, this.name});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductId {
  int? id;
  String? name;
  String? slug;
  String? image;
  CategoryProductId? categoryProductId;
  String? code;
  int? stoke;
  int? price;
  String? desc;
  UserId? userId;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  ProductId(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.categoryProductId,
      this.code,
      this.stoke,
      this.price,
      this.desc,
      this.userId,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  ProductId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    categoryProductId = json['category_product_id'] != null
        ? new CategoryProductId.fromJson(json['category_product_id'])
        : null;
    code = json['code'];
    stoke = json['stoke'];
    price = json['price'];
    desc = json['desc'];
    userId =
        json['user_id'] != null ? new UserId.fromJson(json['user_id']) : null;
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    if (this.categoryProductId != null) {
      data['category_product_id'] = this.categoryProductId!.toJson();
    }
    data['code'] = this.code;
    data['stoke'] = this.stoke;
    data['price'] = this.price;
    data['desc'] = this.desc;
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CategoryProductId {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  CategoryProductId(
      {this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  CategoryProductId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
