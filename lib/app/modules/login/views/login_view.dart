import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiktok/app/routes/app_pages.dart';
import 'package:tiktok/app/utils/colors.dart';
import 'package:tiktok/app/widgets/auth_button.dart';
import 'package:tiktok/app/widgets/auth_text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
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
              'Login',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 25),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: AuthTextField(
                      controller: controller.emailController,
                      labelText: "Email",
                      prefixIcon: Icons.email_rounded,
                      errorText: "Username/Email required",
                      capitalization: TextCapitalization.none,
                      inputType: TextInputType.name,
                    ),
                  ),
                  SizedBox(height: 25),
                  Obx(
                    () => Container(
                      width: size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: AuthTextField(
                        controller: controller.passwordController,
                        labelText: "Password",
                        prefixIcon: Icons.lock_outline_rounded,
                        isPassword: true,
                        capitalization: TextCapitalization.none,
                        errorText: "Password required",
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
                      authText: "Login",
                      onPress: () {
                        if (controller.formKey.currentState!.validate()) {}
                      },
                    ),
            ),
            // if there is no account then go to signup
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.SIGNUP),
                  child: Text(
                    'Sign Up',
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
      ),
    );
  }
}
