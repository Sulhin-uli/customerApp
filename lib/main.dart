import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/utils/error_screen.dart';
import 'package:customer_app/app/utils/loading_screen.dart';
import 'package:customer_app/app/utils/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/date_symbol_data_file.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getInitialMessage();
  await GetStorage.init();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "TaniKula",
                  initialRoute: authC.isSkipIntro.isTrue
                      ? authC.isAuth.isTrue
                          ? Routes.HOME
                          : Routes.LOGIN
                      : Routes.LOGIN,
                  // : Routes.INTRODUCTION,
                  // : Routes.ULASAN,
                  theme: ThemeData(
                    primarySwatch: Colors.green,
                  ),
                  getPages: AppPages.routes,
                );
              }

              return SplashScreen();
            },
          );
        }

        return LoadingScreen();
      },
    );
  }
}
