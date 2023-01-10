import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/app/modules/home/views/home_view.dart';
import 'package:tiktok/app/modules/login/views/login_view.dart';
import 'package:tiktok/app/utils/firebase.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool showPassword = false.obs;
  RxBool showLoading = false.obs;
  late Rx<User?> _user;

  // password visible
  onVisibilityChange() {
    showPassword.value = !showPassword.value;
  }

// password visible end

// login user
  onLoginUser() async {
    showLoading.value = true;
    try {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        await FirebaseUtils.firebaseAuth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        Get.snackbar(
          'Error Logging In',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error Logging In",
        e.toString(),
      );
    }
    showLoading.value = false;
  }

  // login user end

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseUtils.firebaseAuth.currentUser);
    _user.bindStream(FirebaseUtils.firebaseAuth.authStateChanges());
    ever(_user, (User? user) {
      if (user == null) {
        Get.offAllNamed("/login");
      } else {
        Get.offAllNamed("/home");
      }
    });
  }
}
