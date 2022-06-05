// import 'package:gapoktan_app/app/data/models/product_category_model.dart';
// import 'package:gapoktan_app/app/data/models/user_model.dart';

// class Product {
//   int? id;
//   String? name;
//   String? slug;
//   String? image;
//   ProductCategory? categoryProductId;
//   String? code;
//   int? stoke;
//   int? price;
//   String? desc;
//   User? userId;
//   int? isActive;
//   String? createdAt;
//   String? updatedAt;

//   Product(
//       {this.id,
//       this.name,
//       this.slug,
//       this.image,
//       this.categoryProductId,
//       this.code,
//       this.stoke,
//       this.price,
//       this.desc,
//       this.userId,
//       this.isActive,
//       this.createdAt,
//       this.updatedAt});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//     categoryProductId = json['category_product_id'] != null
//         ? ProductCategory.fromJson(json['category_product_id'])
//         : null;
//     code = json['code'];
//     stoke = json['stoke'];
//     price = json['price'];
//     desc = json['desc'];
//     userId =
//         json['user_id'] != null ? User.fromJson(json['user_id']) : null;
//     isActive = json['is_active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['slug'] = slug;
//     data['image'] = image;
//     if (categoryProductId != null) {
//       data['category_product_id'] = categoryProductId!.toJson();
//     }
//     data['code'] = code;
//     data['stoke'] = stoke;
//     data['price'] = price;
//     data['desc'] = desc;
//     if (userId != null) {
//       data['user_id'] = userId!.toJson();
//     }
//     data['is_active'] = isActive;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
