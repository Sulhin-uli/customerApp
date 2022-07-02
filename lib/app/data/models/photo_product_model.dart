import 'package:customer_app/app/data/models/product_model.dart';

class PhotoProduct {
  int? id;
  ProductModel? productId;
  String? name;
  String? createdAt;
  String? updatedAt;

  PhotoProduct(
      {this.id, this.productId, this.name, this.createdAt, this.updatedAt});

  PhotoProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'] != null
        ? ProductModel?.fromJson(json['product_id'])
        : null;
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (productId != null) {
      data['product_id'] = productId?.toJson();
    }
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static List<PhotoProduct> fromJsonList(List data) {
    if (data.isEmpty) return [];
    return data.map((e) => PhotoProduct.fromJson(e)).toList();
  }

  @override
  String toString() => name!;
}
