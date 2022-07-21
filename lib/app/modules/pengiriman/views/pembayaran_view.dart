// import 'package:customer_app/app/modules/pengiriman/controllers/pengiriman_controller.dart';
// import 'package:flutter/material.dart';
import 'dart:async';

import 'package:customer_app/app/utils/constant.dart';
import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class PembayaranView extends GetView<PengirimanController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: BackButton(color: Colors.black),
//         elevation: 0.5,
//         title: Text(
//           'Pembayaran',
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//       ),
//       body: Stack(
//         children: [
//           WebView(
//             initialUrl:
//                 // "https://app.sandbox.midtrans.com/snap/v3/redirection/ffac2bd2-e18e-471a-b90d-ba7dfae42933",
//                 Get.arguments,
//             javascriptMode: JavascriptMode.unrestricted,
//             onPageFinished: (e) {
//               controller.isLoadingWeb(false);
//             },
//           ),
//           Obx(
//             () => controller.isLoadingWeb.isTrue
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : Container(),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PembayaranView extends StatefulWidget {
  @override
  PembayaranViewState createState() => PembayaranViewState();
}

final Completer<WebViewController> _controller = Completer<WebViewController>();

class PembayaranViewState extends State<PembayaranView> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
        title: Text(
          'Pembayaran',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl:
                // "https://app.sandbox.midtrans.com/snap/v3/redirection/ffac2bd2-e18e-471a-b90d-ba7dfae42933",
                Get.arguments,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context),
            },
            onPageFinished: (String url) {
              setState(() {
                isLoading = false;
                // Navigator.pop(context);

                // readResponse();
                // print('Page finished loading: $url');
                try {
                  String resultUrl = url.substring(0, url.indexOf('?'));
                  String successUrl =
                      "https://39f3-112-215-238-183.ap.ngrok.io/payments/completed";
                  if (resultUrl == successUrl) {
                    print("Pembayaran Sukses");
                    Navigator.pop(context);
                    dialogSuccess("Pembayaran Sukses");
                  } else {
                    print("tidak sama");
                  }
                } catch (e) {}
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }

  // void readResponse() {
  //   setState(() {
  //     _controller
  //         .evaluateJavascript("document.documentElement.innerHTML")
  //         .then((value) async {
  //       if (value.contains("name=\"paymentId\"")) {
  //       } else {}
  //     });
  //   });
  // }
}

JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
}
