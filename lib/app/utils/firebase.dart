import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUtils {
  static var firebaseAuth = FirebaseAuth.instance;
  static var firebaseStorage=FirebaseStorage.instance;
  static var fireStore=FirebaseFirestore.instance;
}
