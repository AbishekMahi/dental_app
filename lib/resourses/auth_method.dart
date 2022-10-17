import 'dart:js';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/resourses/storage_method.dart';
import 'package:dental_app/screens/home-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Signup user
  Future signupUser({
    required String fname,
    required String lname,
    required Uint8List file,
    required String email,
    required String password,
    required String cpassword,
    required String age,
    required String phone,
  }) async {
    String res = "Some error Occured";
    try {
      if (email.isNotEmpty ||
          fname.isNotEmpty ||
          lname.isNotEmpty ||
          file != null ||
          phone.isNotEmpty ||
          age.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        print(cred.user!.uid);

        String photoUrl =
            await StorageMethod().uploadImgToStorage('profileimg', file);
        // add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'first name': fname,
          'last name': lname,
          'uid': cred.user!.uid,
          'email': email,
          'age': age,
          'profileimg': photoUrl,
          'phone number': phone,
        });
        res = "Success";
      }
    }
    // on FirebaseAuthException catch (err) {
    //   if (err.code == 'invalid-email') {
    //     res = 'the email is badly formatted';
    //   }
    // }
    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
