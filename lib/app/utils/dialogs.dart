import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/app/widgets/dialog_option.dart';
import 'package:get/get.dart';

class AppDialogs {
   showOptionDialog({
    required BuildContext context,
    required VoidCallback onPressed,
  }) =>
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          content: Column(
            children: [
              DialogOption(
                optionsIcon: Icons.image,
                optionsText: "Gallery",
                onClick: onPressed,
              ),
              DialogOption(
                optionsIcon: Icons.camera_alt,
                optionsText: "Camera",
                onClick: onPressed,
              ),
            ],
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: Text('Cancel'),
              isDestructiveAction: true,
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      );
}
