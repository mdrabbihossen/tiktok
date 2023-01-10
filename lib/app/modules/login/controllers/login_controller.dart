import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/app/utils/firebase.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool showPassword = false.obs;
  RxBool showLoading = false.obs;

  // password visible
  onVisibilityChange() {
    showPassword.value = !showPassword.value;
  }

// password visible end

// login user
  onLoginUser() async {
    showLoading.value = true;
    try{
      if(emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty){
        await FirebaseUtils.firebaseAuth.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
      }
    }catch(e){
      Get.snackbar(
        "Error Logging In",
        e.toString(),
      );
    }
    showLoading.value = false;
  }
  // login user end
}
