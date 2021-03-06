import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easetour_flutter/resources/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //signup user
  Future<String> signUpUSer({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred.";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
            
        // add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });

        // await _firestore.collection('users').add({
        // 'username': username,
        // 'uid': cred.user!.uid,
        //'email': email,
        // 'bio': bio,
        //'followers': [],
        //'following': [],
        //});
        res = "Success.";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
