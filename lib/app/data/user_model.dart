import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;

  User({
    required this.name,
    required this.email,
    required this.uid,
    required this.profilePhoto,
  });

  static User fromSnap(DocumentSnapshot snapshot) {
    var _snapshot = snapshot.data() as Map<String, dynamic>;
    return User(
      name: _snapshot['name'],
      email: _snapshot['email'],
      profilePhoto: _snapshot['profilePhoto'],
      uid: _snapshot['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "profilePhoto": profilePhoto,
      "email": email,
      "uid": uid,
    };
  }
}