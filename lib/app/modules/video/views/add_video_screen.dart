import 'package:get/get.dart';
import 'package:tiktok/app/modules/video/controllers/video_controller.dart';
import 'package:flutter/material.dart';

class AddVideoScreen extends GetView<VideoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          'Add Video Screen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
