import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  // bio, displayName, id, photoUrl, timestamp, username, email
  final String bio;
  final String displayName;
  final String photoUrl;
  final String username;
  final String email;
  final String id;

  User({this.id, this.username, this.email, this.photoUrl, this.displayName, this.bio});

  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      id: doc["id"],
      bio: doc["bio"],
      displayName: doc["displayName"],
      photoUrl: doc["photoUrl"],
      username: doc["username"],
      email: doc["email"]
    );
  }

  
  
}