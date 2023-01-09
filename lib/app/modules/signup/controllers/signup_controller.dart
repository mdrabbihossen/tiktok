import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool showPassword = false.obs;
  RxBool showLoading = false.obs;

  onVisibilityChange() {
    showPassword.value = !showPassword.value;
  }

  registerUser(
      String username, String email, String password, File? image) async {
    showLoading.value = true;
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {

      }
    } catch (e) {
      Get.snackbar("Error Creating account", e.toString());
    }
  }
}
