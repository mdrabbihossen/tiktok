import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiktok/app/utils/colors.dart';
import 'package:tiktok/app/widgets/auth_button.dart';
import 'package:tiktok/app/widgets/auth_text_field.dart';

import '../controllers/signup_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Tiktok',
            style: TextStyle(
              fontSize: 35,
              color: AppColors.buttonColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 25),
          Stack(
            children: [
              const CircleAvatar(
                radius: 64,
                backgroundImage: CachedNetworkImageProvider(
                    'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                backgroundColor: Colors.black,
              ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_a_photo,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                Container(

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: AuthTextField(
                    controller: controller.usernameController,
                    labelText: "Username",
                    prefixIcon: Icons.person,
                    errorText: "Username Required",
                  ),
                ),
                SizedBox(height: 15),
                Container(

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: AuthTextField(
                    controller: controller.emailController,
                    labelText: "Email",
                    prefixIcon: Icons.email_rounded,
                    errorText: "Email Required",
                  ),
                ),
                SizedBox(height: 15),
                Obx(
                  () => Container(

                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: AuthTextField(
                      controller: controller.passwordController,
                      labelText: "Password",
                      prefixIcon: Icons.lock_outline_rounded,
                      isPassword: true,
                      errorText: "Password Required",
                      showPassword: controller.showPassword.value,
                      showPasswordPressed: () {
                        controller.onVisibilityChange();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Obx(
            () => controller.showLoading.value
                ? CircularProgressIndicator()
                : AuthButton(
                    size: size,
                    authText: "SignUp",
                    onPress: () {
                      if (controller.formKey.currentState!.validate()) {}
                    },
                  ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.buttonColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
