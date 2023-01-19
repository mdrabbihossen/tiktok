import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/app/modules/video/controllers/video_controller.dart';
import 'package:video_player/video_player.dart';

class ConfirmVideoScreen extends GetView<VideoController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VideoController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            SizedBox(
              width: size.width,
              height: size.height / 1.5,
              child: VideoPlayer(
                controller.videoPlayerController.value,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
