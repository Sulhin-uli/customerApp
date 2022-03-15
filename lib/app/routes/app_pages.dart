import 'package:get/get.dart';

import '../modules/alamat/bindings/alamat_binding.dart';
import '../modules/alamat/views/alamat_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/daftar/bindings/daftar_binding.dart';
import '../modules/daftar/views/daftar_view.dart';
import '../modules/detail_produk/bindings/detail_produk_binding.dart';
import '../modules/detail_produk/views/detail_produk_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/keranjang/bindings/keranjang_binding.dart';
import '../modules/keranjang/views/keranjang_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/produk/bindings/produk_binding.dart';
import '../modules/produk/views/produk_view.dart';
import '../modules/saya/bindings/saya_binding.dart';
import '../modules/saya/views/saya_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR,
      page: () => DaftarView(),
      binding: DaftarBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUK,
      page: () => DetailProdukView(),
      binding: DetailProdukBinding(),
    ),
    GetPage(
      name: _Paths.KERANJANG,
      page: () => KeranjangView(),
      binding: KeranjangBinding(),
    ),
    GetPage(
      name: _Paths.SAYA,
      page: () => SayaView(),
      binding: SayaBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK,
      page: () => ProdukView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.ALAMAT,
      page: () => AlamatView(),
      binding: AlamatBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
  ];
}
