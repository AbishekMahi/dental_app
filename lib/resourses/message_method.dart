import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String datetime = DateFormat("ddMMMyyyyhhmma").format(DateTime.now());
  String currentTime = DateFormat("dd MMM yyyy hh:mm a").format(DateTime.now());
  String userImg = "";
  String userFname = "";

  // book and store Appointment
  Future createMsg({
    String? status,
    required String subject,
    required String message,
    required String userImg,
    required String userFname,
    String? userLname,
  }) async {
    String res = "Some Error Occured";
    try {
      if (subject.isNotEmpty || message.isNotEmpty) {
        // add Message to database
        await _firestore
            // .collection('users')
            // .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('messages')
            .doc(datetime)
            .set({
          'user fname': userFname,
          'user lname': userLname,
          'user email': FirebaseAuth.instance.currentUser!.email,
          'subject': subject,
          'user img': userImg,
          'message': message,
          'messaged time': currentTime,
        });
        res = "Success";
      }
    } catch (err) {
      res = err.toString();
      print(datetime);
    }
    return res;
  }
}
