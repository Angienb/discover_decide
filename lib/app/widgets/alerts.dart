import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(String title, String message, {required IconData icon}) {
  Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      borderRadius: 10,
      icon: Icon(icon, color: Colors.white),
      backgroundColor: Colors.black87,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      duration: const Duration(seconds: 3)));
}
