import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/photo_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/photo_product_provider.dart';
import 'package:customer_app/app/data/providers/product_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProdukController extends GetxController {
  var carouselIndex = 0.obs;
  var product = List<ProductModel>.empty().obs;
  var photoProduct = List<PhotoProduct>.empty().obs;
  var photoProductByProductId = List<PhotoProduct>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    getDataPhoto();
    getData();
  }

  void getDataPhoto() async {
    PhotoProductProvider().getData().then((response) {
      try {
        response["data"].map((e) {
          final data = PhotoProduct(
            id: e["id"],
            productId: ProductModel(
              id: e["product_id"]["id"],
              name: e["product_id"]["name"],
              slug: e["product_id"]["slug"],
              categoryProductId: CategoryProductModel(
                id: e["product_id"]["category_product_id"]["id"],
                name: e["product_id"]["category_product_id"]["name"],
                slug: e["product_id"]["category_product_id"]["slug"],
                createdAt: e["product_id"]["category_product_id"]["created_at"],
                updatedAt: e["product_id"]["category_product_id"]["updated_at"],
              ),
              code: e["product_id"]["code"],
              stoke: e["product_id"]["stoke"],
              price: e["product_id"]["price"],
              desc: e["product_id"]["desc"],
              userId: UserModel(
                id: e["product_id"]["user_id"]["id"],
                name: e["product_id"]["user_id"]["name"],
              ),
              isActive: e["product_id"]["isActive"],
            ),
            name: e["name"],
            createdAt: e["created_at"],
            updatedAt: e["updated_at"],
          );
          photoProduct.add(data);
        }).toList();
      } catch (e) {
        print(e.toString());
      }
    });
  }

  void getPhotoProductById(int productId) {
    for (var item in photoProduct) {
      if (item.productId!.id == productId) {
        final data = PhotoProduct(
          id: item.id,
          productId: ProductModel(
            id: item.productId!.id,
            name: item.productId!.name,
            slug: item.productId!.slug,
            categoryProductId: CategoryProductModel(
              id: item.productId!.categoryProductId!.id,
              name: item.productId!.categoryProductId!.name,
              slug: item.productId!.categoryProductId!.slug,
              createdAt: item.productId!.categoryProductId!.createdAt,
              updatedAt: item.productId!.categoryProductId!.updatedAt,
            ),
            code: item.productId!.code,
            stoke: item.productId!.stoke,
            price: item.productId!.price,
            desc: item.productId!.desc,
            userId: UserModel(
              id: item.productId!.userId!.id,
              name: item.productId!.userId!.name,
            ),
            isActive: item.productId!.isActive,
          ),
          name: item.name,
          createdAt: item.createdAt,
          updatedAt: item.updatedAt,
        );
        photoProductByProductId.insert(0, data);
      } else {
        print("not found");
      }
    }
  }

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
          final item = findByid(e["id"]);
          for (var itemPhoto in photoProduct) {
            // item.image = itemPhoto.name;
            if (itemPhoto.productId!.id == item.id) {
              item.image = itemPhoto.name;
              product.refresh();
            }
          }
        }).toList();
      } catch (e) {
        Get.toNamed(Routes.ERROR, arguments: e.toString());
      }
    });
  }

// cari berdasarka id
  ProductModel findByid(int id) {
    return product.firstWhere((element) => element.id == id);
  }

  ProductModel findBySlug(String slug) {
    return product.firstWhere((element) => element.slug == slug);
  }
}
