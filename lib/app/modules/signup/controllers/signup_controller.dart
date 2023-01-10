import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/app/utils/firebase.dart';
import '../../../data/user_model.dart' as model;

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

  // picked image
  onImagePicked() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      Get.snackbar(
        "Profile Picture",
        "You have successfully selected your profile picture!",
      );
    }
    profilePhoto.value = File(pickedImage!.path);
  }

  // picked image end
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
        String downloadUrl = await _uploadToStorage();
        model.User user = model.User(
          name: usernameController.text,
          email: emailController.text,
          profilePhoto: downloadUrl,
          uid: credential.user!.uid,
        );
        await FirebaseUtils.fireStore
            .collection('users')
            .doc(credential.user!.uid)
            .set(
              user.toJson(),
            );
      } else {
        Get.snackbar(
          'Error',
          'Please fill all the fields',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar("Error Creating account", e.toString());
      print(e.toString());
    }
    showLoading.value = false;
  }

  // register account end

  // upload to storage
  Future<String> _uploadToStorage() async {
    Reference ref = FirebaseUtils.firebaseStorage
        .ref()
        .child('profilePhotos')
        .child(FirebaseUtils.firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(profilePhoto.value);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
// upload to storage end
}
