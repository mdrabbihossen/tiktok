import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiktok/app/modules/video/controllers/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/app/utils/colors.dart';
import 'package:tiktok/app/utils/dialogs.dart';

class AddVideoScreen extends GetView<VideoController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VideoController());
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          color: AppColors.buttonColor,
          child: Text(
            'Add Video',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          // pick the video
          onPressed: () {
            AppDialogs().showOptionDialog(
              context: context,
              onPressed: () {
                controller.pickVideo();
              },
            );
          },
        ),
      ),
    );
  }
}
