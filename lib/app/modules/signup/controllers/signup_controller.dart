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
}
