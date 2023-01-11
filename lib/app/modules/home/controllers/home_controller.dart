import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/app/modules/video/views/add_video_screen.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  static List<Widget> pages = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    AddVideoScreen(),
    Center(
      child: Text('Message'),
    ),
    Center(
      child: Text('Account'),
    ),
  ];
  RxInt selectedIndex = 0.obs;
  Rx<Widget> selectedPage = pages[0].obs;

  changeSelectedIndex(int index) {
    selectedIndex.value = index;
    selectedPage.value = pages[index];
  }
}
