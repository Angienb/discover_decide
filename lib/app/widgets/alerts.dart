import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

showSnackBar(String title, String message) {
  Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      borderRadius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      duration: const Duration(seconds: 3)));
}
