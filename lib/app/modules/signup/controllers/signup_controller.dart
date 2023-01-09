import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/app/utils/firebase.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool showPassword = false.obs;
  RxBool showLoading = false.obs;
  Rx<File> profilePhoto = File('').obs;

  onVisibilityChange() {
    showPassword.value = !showPassword.value;
  }

  // register account
  registerUser() async {
    showLoading.value = true;

    try {
      if (usernameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        UserCredential credential =
            await FirebaseUtils.firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        String downloadUrl = await _uploadToStorage(profilePhoto.value);
      }
    } catch (e) {
      Get.snackbar("Error Creating account", e.toString());
    }
  }

  // register account end

  // upload to storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = FirebaseUtils.firebaseStorage
        .ref()
        .child('profilePics')
        .child(FirebaseUtils.firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
// upload to storage end
}
