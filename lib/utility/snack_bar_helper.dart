import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarHelper {
  static void showErrorSnackBar(String message, {String title = "Erro"}) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;
    final margin = screenWidth >= 300 ? const EdgeInsets.symmetric(horizontal: 300) : EdgeInsets.zero;

    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 20,
      margin: margin,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error, color: Colors.white),
    );
  }

  static void showSuccessSnackBar(String message, {String title = "Sucesso"}) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;
    final margin = screenWidth >= 300 ? const EdgeInsets.symmetric(horizontal: 300) : EdgeInsets.zero;

    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 20,
      margin: margin,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }
}
