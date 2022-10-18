import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class AppointMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String datetime = DateFormat("ddMMMyyyyhhmma").format(DateTime.now());

// book and store Appointment
  Future createAppointment({
    required String type,
    required String currentTime,
    required String appointmentTime,
  }) async {
    String res = "Some error Occured";
    try {
      if (type.isNotEmpty ||
          currentTime.isNotEmpty ||
          appointmentTime.isNotEmpty) {
        // add Appointment to database
        await _firestore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('appointments')
            .doc(datetime)
            .set({
          'appointment type': type,
          'current time': currentTime,
          'appoint time': appointmentTime,
        });
        res = "Success";

        print(datetime);
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
}
