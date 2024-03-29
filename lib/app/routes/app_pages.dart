import 'package:customer_app/app/modules/forget_password/bindings/forget_password_binding.dart';
import 'package:customer_app/app/modules/forget_password/views/forget_password_view.dart';
import 'package:customer_app/app/modules/riwayat_pemesanan/views/pembatalan_view.dart';
import 'package:customer_app/app/modules/produk/views/detail_toko_view.dart';
import 'package:customer_app/app/modules/riwayat_pemesanan/views/rincian_pembatalan_view.dart';
import 'package:customer_app/app/modules/saya/views/information_account.dart';
import 'package:customer_app/app/modules/ulasan/views/multiple_ulas_view.dart';
import 'package:get/get.dart';

import '../modules/alamat/bindings/alamat_binding.dart';
import '../modules/alamat/views/add_alamat_view.dart';
import '../modules/alamat/views/alamat_view.dart';
import '../modules/alamat/views/edit_alamat_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/detail_chat/bindings/detail_chat_binding.dart';
import '../modules/detail_chat/views/detail_chat_view.dart';
import '../modules/detail_produk/bindings/detail_produk_binding.dart';
import '../modules/detail_produk/views/detail_produk_view.dart';
import '../modules/detail_produk/views/widgets/image_view.dart';
import '../modules/error/bindings/error_binding.dart';
import '../modules/error/views/error_view.dart';
import '../modules/error/views/print_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/ongkir/bindings/ongkir_binding.dart';
import '../modules/ongkir/views/ongkir_view.dart';
import '../modules/pengiriman/bindings/pengiriman_binding.dart';
import '../modules/pengiriman/views/invoice_view.dart';
import '../modules/pengiriman/views/pembayaran_view.dart';
import '../modules/pengiriman/views/pengiriman_view.dart';
import '../modules/pengiriman/views/widgets/cek_ongkir_widget.dart';
import '../modules/produk/bindings/produk_binding.dart';
import '../modules/produk/views/kategori_produk_view%20.dart';
import '../modules/produk/views/produk_view.dart';
import '../modules/produk/views/search_produk_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/riwayat_pemesanan/bindings/riwayat_pemesanan_binding.dart';
import '../modules/riwayat_pemesanan/views/detail_riwayat_pesanan_view.dart';
import '../modules/riwayat_pemesanan/views/riwayat_pemesanan_view.dart';
import '../modules/saya/bindings/saya_binding.dart';
import '../modules/saya/views/edit_password_view.dart';
import '../modules/saya/views/edit_profile_view.dart';
import '../modules/saya/views/saya_view.dart';
import '../modules/saya/views/widget/photo_profile_view.dart';
import '../modules/toko/bindings/toko_binding.dart';
import '../modules/toko/views/toko_view.dart';
import '../modules/ulasan/bindings/ulasan_binding.dart';
import '../modules/ulasan/views/all_review_view.dart';
import '../modules/ulasan/views/ulasan_view.dart';
import '../modules/wishlist/bindings/wishlist_binding.dart';
import '../modules/wishlist/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    // AUTH
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION_ACCOUNT,
      page: () => InformationAccountView(),
      binding: SayaBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUK,
      page: () => DetailProdukView(),
      binding: DetailProdukBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => NotifikasiView(),
      binding: NotifikasiBinding(),
    ),

    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CHAT,
      page: () => DetailChatView(),
      binding: DetailChatBinding(),
    ),
    GetPage(
      name: _Paths.TOKO,
      page: () => TokoView(),
      binding: TokoBinding(),
    ),
    GetPage(
      name: _Paths.PENGIRIMAN,
      page: () => PengirimanView(),
      binding: PengirimanBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: _Paths.ERROR,
      page: () => ErrorView(),
      binding: ErrorBinding(),
    ),
    GetPage(
      name: _Paths.PRINT,
      page: () => PrintView(),
      binding: ErrorBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    // Saya
    GetPage(
      name: _Paths.SAYA,
      page: () => SayaView(),
      binding: SayaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: SayaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PASSWORD,
      page: () => EditPasswordView(),
      binding: SayaBinding(),
    ),
    // Alamat
    GetPage(
      name: _Paths.ALAMAT,
      page: () => AlamatView(),
      binding: AlamatBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ALAMAT,
      page: () => AddAlamatView(),
      binding: AlamatBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ALAMAT,
      page: () => EditAlamatView(),
      binding: AlamatBinding(),
    ),

    // Produk
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchProdukView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK,
      page: () => ProdukView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_VIEW,
      page: () => ImageView(),
      // binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI_VIEW,
      page: () => KategoriView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TOKO,
      page: () => DetailTokoView(),
      binding: ProdukBinding(),
    ),

    //Pengiriman
    GetPage(
      name: _Paths.PEMBAYARAN,
      page: () => PembayaranView(),
      binding: RiwayatPemesananBinding(),
    ),
    GetPage(
      name: _Paths.PEMBATALAN,
      page: () => PembatalanView(),
      binding: RiwayatPemesananBinding(),
    ),
    GetPage(
      name: _Paths.RINCIAN_PEMBATALAN,
      page: () => RincianPembatalanView(),
      binding: RiwayatPemesananBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => InvoiceView(),
      binding: PengirimanBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_PEMESANAN,
      page: () => RiwayatPemesananView(),
      binding: RiwayatPemesananBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSAKSI,
      page: () => DetailRiwayatPemesananView(),
      binding: RiwayatPemesananBinding(),
    ),
    // GetPage(
    //   name: _Paths.ONGKIR,
    //   page: () => OngkirView(),
    //   binding: OngkirBinding(),
    // ),
    GetPage(
      name: _Paths.CEK_ONGKIR,
      page: () => CekOngkirView(),
      binding: PengirimanBinding(),
    ),
    GetPage(
      name: _Paths.ULASAN,
      page: () => const UlasanView(),
      binding: UlasanBinding(),
    ),
    GetPage(
      name: _Paths.ALL_ULASAN,
      page: () => AllReviewView(),
      binding: UlasanBinding(),
    ),
    GetPage(
      name: _Paths.MULTIPLE_ULASAN,
      page: () => MultipleUlas(),
      binding: RiwayatPemesananBinding(),
    ),

    GetPage(
      name: _Paths.PHOTO_PROFILE,
      page: () => PhotoProfileView(),
      // binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO_PROFILE_URL,
      page: () => PhotoProfileUrlView(),
      // binding: ProdukBinding(),
    ),
  ];
}
