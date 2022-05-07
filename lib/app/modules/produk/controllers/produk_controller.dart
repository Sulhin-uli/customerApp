import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/product_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProdukController extends GetxController {
  var product = List<ProductModel>.empty().obs;

  void getData() async {
    ProductProvider().getData().then((response) {
      try {
        response["data"].map((e) {
          final data = ProductModel(
            id: e["id"],
            name: e["name"],
            slug: e["slug"],
            categoryProductId: CategoryProductModel(
              id: e["category_product_id"]["id"],
              name: e["category_product_id"]["name"],
              slug: e["category_product_id"]["slug"],
              createdAt: e["category_product_id"]["created_at"],
              updatedAt: e["category_product_id"]["updated_at"],
            ),
            code: e["code"],
            stoke: e["stoke"],
            price: e["price"],
            desc: e["desc"],
            userId: UserModel(
              id: e["category_product_id"]["id"],
              name: e["category_product_id"]["name"],
            ),
            isActive: e["isActive"],
          );
          product.add(data);
        }).toList();
      } catch (e) {
        Get.toNamed(Routes.ERROR, arguments: e.toString());
      }

      // print(product[0].categoryProductId!.id);
    });
  }

  ProductModel findBySlug(String slug) {
    return product.firstWhere((element) => element.slug == slug);
  }
}
