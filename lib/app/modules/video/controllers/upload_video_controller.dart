import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok/app/utils/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  // upload video
  uploadVideo() async {
    try {
      String uid = FirebaseUtils.firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await FirebaseUtils.fireStore.collection('users').doc(uid).get();
      var allDocs = await FirebaseUtils.fireStore.collection('videos').get();
      int len = allDocs.docs.length;

    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }
// upload video end
}
