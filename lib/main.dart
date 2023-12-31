import 'package:discover_decide/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/theme/theme_data.dart';
import 'routes/routes.dart';

void main() async {
  GetMaterialApp appMaterial = GetMaterialApp(
      fallbackLocale: const Locale('en', 'GB'),
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      builder: mainBuilder,
      transitionDuration: const Duration(milliseconds: 237),
      defaultTransition: Transition.noTransition,
      theme: appTheme(),
      title: 'Discover Decide');
  runApp(appMaterial);
}

Widget mainBuilder(BuildContext context, Widget? child) {
  return Overlay(initialEntries: [OverlayEntry(builder: (context) => child!)]);
}
