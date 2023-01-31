import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tiktok/app/modules/video/controllers/video_controller.dart';
import 'package:video_player/video_player.dart';
import '../../../widgets/auth_text_field.dart';
import 'package:flutter/cupertino.dart';

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
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height / 1.5,
                  child: VideoPlayer(
                    controller.videoPlayerController.value,
                  ),
                ),
                // pause button in the middle of the video
                Obx(
                  () => Positioned(
                    top: size.height / 3.5,
                    left: size.width / 2.5,
                    child: CupertinoButton(
                      child: Icon(
                        controller.isPlaying.value
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      ),
                      onPressed: () {
                        controller.pauseVideo();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width - 20,
                    child: AuthTextField(
                      controller: controller.songController,
                      labelText: "Song Name",
                      prefixIcon: Icons.music_note,
                      errorText: "Title required",
                      inputType: TextInputType.name,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width - 20,
                    child: AuthTextField(
                      controller: controller.captionController,
                      labelText: "Caption",
                      prefixIcon: Icons.closed_caption,
                      errorText: "Caption required",
                      inputType: TextInputType.name,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.uploadVideo();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, size.height * 0.07),
                      ),
                      child: Text(
                        'Share!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
