import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/presentation/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Real Estate App',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
    ),
  );
}