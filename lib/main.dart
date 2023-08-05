import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/app/routes/app_pages.dart';

import 'app/common/colors.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tentwemty',
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.lightGray,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
