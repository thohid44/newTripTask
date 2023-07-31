import 'package:bus/map/show_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'map/map_view_page.dart';
import 'pages/Login/view/login_screen.dart';
import 'pages/TripPages/views/trip_page.dart';
import 'rating/view/rating_page_30.dart';
import 'rating/view/star_rating_32.dart';

void main() {
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
      builder: (context , child) {
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
      child: MapSample(),
      
    );
  }
}
