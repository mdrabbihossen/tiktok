import 'package:get/get.dart';
import 'package:tiktok/app/modules/video/controllers/upload_video_controller.dart';

import '../controllers/video_controller.dart';

class VideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoController>(
      () => VideoController(),
    );
    Get.lazyPut<UploadVideoController>(() => UploadVideoController());
  }
}
