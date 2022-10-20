import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String datetime = DateFormat("ddMMMyyyyhhmma").format(DateTime.now());

  // book and store Appointment
  Future createAppointment({
    required String type,
    String? status,
    required String currentTime,
    required String appointmentTime,
    required String appointmentDate,
  }) async {
    String res = "Some error Occured";
    try {
      if (type.isNotEmpty ||
          currentTime.isNotEmpty ||
          appointmentTime.isNotEmpty ||
          appointmentDate.isNotEmpty) {
        // add Appointment to database
        await _firestore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('appointments')
            // .doc(datetime)
            .doc(datetime)
            .set({
          'appointment for': type,
          'appointed time': currentTime,
          'appointment time': appointmentTime,
          'appointment date': appointmentDate,
          'appoint id': datetime,
          'appointment date full': DateTime.now(),
          'status': 'pending',
          'amount paid': '00.0',
          'prescription': 'https://i.postimg.cc/66YVxvqN/prescription.jpg'
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

      print(datetime);
    }
    return res;
  }

  // Delete appointment
  Future<void> deleteAppointment(datetime) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('appointments')
          .doc(datetime)
          .delete();
    } catch (e) {
      return;
    }
  }
}
