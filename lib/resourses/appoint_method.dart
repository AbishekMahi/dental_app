import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class AppointMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String datetime = DateFormat("ddMMMyyyyhhmmssa").format(DateTime.now());

  // book and store Appointment
  Future createAppointment(
      {required String type,
      String? status,
      required String currentTime,
      required String appointmentTime,
      required String appointmentDate,
      required String fName}) async {
    String res = "Some error Occured";
    try {
      if (type.isNotEmpty ||
          currentTime.isNotEmpty ||
          appointmentTime.isNotEmpty ||
          appointmentDate.isNotEmpty) {
        // add Appointment to database
        await _firestore.collection('appointments').doc(datetime).set({
          'appointed by': FirebaseAuth.instance.currentUser!.email,
          'user mail': FirebaseAuth.instance.currentUser!.email,
          'user fname': fName,
          'appointment for': type,
          'appointed time': currentTime,
          'appointment time': appointmentTime,
          'appointment date': appointmentDate,
          'appoint id': datetime,
          'appointment date full': DateTime.now(),
          'status': 'pending',
          'amount paid': '00.0',
          'prescription': '',
          'prescription added': "no",
        });
        res = "Appointment Booked Successfully...";
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
