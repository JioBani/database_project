import 'package:database_project/Style/color_schemes.g.dart';
import 'package:database_project/View/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}