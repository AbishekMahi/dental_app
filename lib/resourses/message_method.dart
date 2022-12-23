import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../utils/submit_button.dart';
import '../utils/textfield.dart';

class MsgForm extends StatefulWidget {
  const MsgForm({super.key});

  @override
  State<MsgForm> createState() => _MsgFormState();
}

class _MsgFormState extends State<MsgForm> {
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _message = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String userFname = "";
  String userLname = "";
  String userImg = "";

  @override
  void dispose() {
    _subject.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      userFname = (snap.data() as Map<String, dynamic>)['first name'];
      userLname = (snap.data() as Map<String, dynamic>)['last name'];
      userImg = (snap.data() as Map<String, dynamic>)['profileimg'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      // height: 200,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 4),
            blurRadius: 3,
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                'Send Your Message:',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: const Color(0xFF006DE9)),
              ),
            ),
            MsgField(
              labelText: 'Subject',
              hintText: 'Subject',
              controller: _subject,
              prefixIcon: Icons.subject,
              maxlength: 30,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a valid input!';
                }
                return null;
              },
            ),
            MsgField(
              labelText: 'Message',
              controller: _message,
              hintText: 'Write Your Message',
              prefixIcon: Icons.message_outlined,
              maxlines: 4,
              maxlength: 500,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a valid input!';
                }
                return null;
              },
            ),
            Submit_Button(
              btntxt: 'Submit',
              fontSize: 18,
              ontouch: () async {
                String datetime =
                    DateFormat("ddMMMyyyyhhmmssa").format(DateTime.now());
                String currentTime =
                    DateFormat("dd MMM yyyy hh:mm:ss a").format(DateTime.now());

                if (_formKey.currentState!.validate()) {
                  String message;
                  try {
                    await FirebaseFirestore.instance
                        .collection('messages')
                        .doc(datetime)
                        .set({
                      'timestamp': FieldValue.serverTimestamp(),
                      'user email': FirebaseAuth.instance.currentUser!.email,
                      'subject': _subject.text,
                      'message': _message.text,
                      'messaged time': currentTime,
                      'user fname': userFname,
                      'user lname': userLname,
                      'user img': userImg,
                    });
                    message = 'Message sent successfully';
                  } catch (e) {
                    message = 'Error when sending message';
                  }

                  // Show a snackbar with the result
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: const Color(0xFF00C75A),
                    content: Text(message),
                  ));
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class MessageMethod {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   String datetime = DateFormat("ddMMMyyyyhhmma").format(DateTime.now());
//   String currentTime = DateFormat("dd MMM yyyy hh:mm a").format(DateTime.now());
//   String userImg = "";
//   String userFname = "";

//   // book and store Appointment
//   Future createMsg({
//     String? status,
//     required String subject,
//     required String message,
//     required String userImg,
//     required String userFname,
//     String? userLname,
//   }) async {
//     String res = "Some Error Occured";
//     try {
//       if (subject.isNotEmpty || message.isNotEmpty) {
//         // add Message to database
//         await _firestore.collection('messages').doc(datetime).set({
          // 'user fname': userFname,
          // 'user lname': userLname,
//           'user email': FirebaseAuth.instance.currentUser!.email,
//           'subject': subject,
//           'user img': userImg,
//           'message': message,
//           'messaged time': currentTime,
//         });
//         res = "Success";
//       }
//     } catch (err) {
//       res = err.toString();
//       print(datetime);
//     }
//     return res;
//   }
// }
