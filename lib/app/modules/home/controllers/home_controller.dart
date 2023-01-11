import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  static const List<Widget> pages = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Add Video'),
    ),
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
