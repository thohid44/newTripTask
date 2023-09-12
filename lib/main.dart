import 'package:bus/map_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'pages/Login/view/login_screen.dart';
import 'dart:io';
void main() {
  // final GoogleMapsFlutterPlatform platform = GoogleMapsFlutterPlatform.instance;
  // // Default to Hybrid Composition for the example.
  // (platform as GoogleMapsFlutterAndroid).useAndroidViewSurface = true;
 // HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trip Task',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp,

            // ),
          ),
          home: child,
        );
      },
      child: LoginScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
