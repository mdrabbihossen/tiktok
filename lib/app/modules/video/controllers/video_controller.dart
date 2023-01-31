import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/app/data/video_model.dart';
import 'package:tiktok/app/modules/video/views/confirm_video_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok/app/utils/firebase.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_compress/video_compress.dart';

class VideoController extends GetxController {
  //TODO: Implement VideoController
  // video player controller added video from file
  final Rx<VideoPlayerController> videoPlayerController =
      VideoPlayerController.file(File('')).obs;
  final RxBool isPlaying = false.obs;
  final TextEditingController songController = TextEditingController();
  final TextEditingController captionController = TextEditingController();

  // video path
  final RxString videoPath = ''.obs;

  // video file
  final Rx<File> videoFile = File('').obs;


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
  }

  // pause video end
  // get thumbnail
  getThumbnail(String videoUrl) async {
    final thumbnail = await VideoCompress.getFileThumbnail(
      videoUrl,
    );
    return thumbnail;
  }

// get thumbnail end

  // upload image to storage
  uploadImageToStorage(String id, String videoPath) async {
    Reference ref =
        FirebaseUtils.firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await getThumbnail(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

// upload image to storage end

  // compress video
  compressVideo(String videoPath) async {
    final compressVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    return compressVideo!.file;
  }

// compress video end

  // upload video to storage
  uploadVideoToStorage(String id, String videoPath) async {
    Reference ref =
        FirebaseUtils.firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await compressVideo(videoPath));
    uploadTask.snapshotEvents.listen((event) {
      print('uploading');
    }, onError: (error) {
      print(error);
    });
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

// upload video to storage end
// upload video
  uploadVideo() async {
    try {
      String uid = FirebaseUtils.firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await FirebaseUtils.fireStore.collection('users').doc(uid).get();
      var allDocs = await FirebaseUtils.fireStore.collection('videos').get();
      int len = allDocs.docs.length;
      String videoUrl =
          await uploadVideoToStorage("video $len", videoPath.value);
      String thumbnail =
          await uploadImageToStorage("Video $len", videoPath.value);
      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $len",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songController.text,
        caption: captionController.text,
        videoUrl: videoUrl,
        thumbnail: thumbnail,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
      );
      await FirebaseUtils.fireStore.collection('videos').doc("Video $len").set(
            video.toJson(),
          );
      Get.back();
      Get.snackbar(
        'Success',
        'Video uploaded successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }
// upload video end
}
