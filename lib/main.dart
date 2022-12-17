import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stealth_startup_technical_exam/core/values/strings.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: appTitle,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
