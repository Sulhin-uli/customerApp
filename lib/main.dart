import 'package:customer_app/app/utils/error_screen.dart';
import 'package:customer_app/app/utils/loading_screen.dart';
import 'package:customer_app/app/utils/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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
                  initialRoute: AppPages.INITIAL,
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
