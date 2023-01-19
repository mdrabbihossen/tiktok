import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/app/modules/video/views/confirm_video_screen.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoController extends GetxController {
  //TODO: Implement VideoController
  // video player controller added video from file
  final Rx<VideoPlayerController> videoPlayerController =
      VideoPlayerController.file(File('')).obs;

  final RxBool isPlaying = false.obs;

  // video player controller added video from camera

  final TextEditingController songController = TextEditingController();
  final TextEditingController captionController = TextEditingController();

  // pick video
  pickVideo() async {
    // is playing
    isPlaying.value = false;
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo != null) {
      // go to confirm video screen
      Get.to(ConfirmVideoScreen());
    }
    videoPlayerController.value =
        VideoPlayerController.file(File(pickedVideo!.path));
    videoPlayerController.value.initialize();
    videoPlayerController.value.play();
    videoPlayerController.value.setVolume(1);
    videoPlayerController.value.setLooping(true);
    isPlaying.value = true;
  }

// pick video end
// pause video
  pauseVideo() {
    if (isPlaying.value) {
      videoPlayerController.value.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController.value.play();
      isPlaying.value = true;
    }
    // videoPlayerController.value.pause();
  }
}
