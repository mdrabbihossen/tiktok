import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/app/routes/app_pages.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoController extends GetxController {
  //TODO: Implement VideoController
  // video player controller added video from file
  final Rx<VideoPlayerController> videoPlayerController =
      VideoPlayerController.file(File('')).obs;

  // video player controller added video from camera

  final TextEditingController songController = TextEditingController();
  final TextEditingController captionController = TextEditingController();

  // pick video
  pickVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo != null) {
      Get.toNamed(Routes.CONFIRM_VIDEO);
    }
    videoPlayerController.value = VideoPlayerController.file(File(pickedVideo!.path));
    videoPlayerController.value.initialize();
    videoPlayerController.value.play();
    videoPlayerController.value.setVolume(1);
    videoPlayerController.value.setLooping(true);
  }

// pick video end
}
