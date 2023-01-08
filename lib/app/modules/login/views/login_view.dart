import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiktok/app/utils/colors.dart';

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
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
            )
          ],
        ),
      )
    );
  }
}
