import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiktok/app/modules/home/component/custom_icon.dart';
import 'package:tiktok/app/utils/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.selectedPage.value,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeSelectedIndex,
          backgroundColor: AppColors.backgroundColor,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                size: 30,
              ),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
