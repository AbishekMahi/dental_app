import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../resourses/message_method.dart';
import '../utils/img_picker.dart';
import '../utils/submit_button.dart';
import '../utils/textfield.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home-screen.dart';

final Uri _phone = Uri.parse('tel:+918552085521');
final Uri _email = Uri.parse('mailto:kiruvin4@gmail.com');

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

void _launchPhone() async {
  if (!await launchUrl(_phone)) throw 'Could not launch $_phone';
}

void _launchMail() async {
  if (!await launchUrl(_email)) throw 'Could not launch $_email';
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  //text editing controller for text field
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _message = TextEditingController();
  String userFname = "";
  String userLname = "";
  String userImg = "";

  @override
  void initState() {
    _subject.text = "";
    _message.text = "";
    super.initState();
  }

  @override
  void dispose() {
    _subject.dispose();
    _message.dispose();
    super.dispose();
  }

  void getUserDetails() async {
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
      decoration: const BoxDecoration(
        image: DecorationImage(
            opacity: 500,
            image: AssetImage("assets/images/bg_pattern.jpg"),
            fit: BoxFit.fitHeight),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF378CEC), Color(0xFF007EE6)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Contact Us",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                height: 200,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 4),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Lottie.asset('assets/lottie/contact.json'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: (_launchPhone),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(2, 8),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      color: Color(0xFF006DE9),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Call Us:',
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF006DE9),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '+91 82563 45323',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF181818),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5, 10, 15, 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: (_launchMail),
                        child: Ink(
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.mail,
                                      color: Color(0xFF006DE9),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Mail Us:',
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF006DE9),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'hello@dentalcare.com',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF181818),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                // height: 200,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Send Your Message:',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: const Color(0xFF006DE9)),
                        ),
                      ),
                      // SubjectField(
                      //   labelText: 'Email Address',
                      //   hintText: 'Email Address',
                      //   prefixIcon: Icons.account_circle_outlined,
                      //   obscureText: false,
                      //   keyboardType: TextInputType.emailAddress,
                      // validator: (value) {
                      //   if (value!.isEmpty ||
                      //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //           .hasMatch(value)) {
                      //     return 'Enter a valid input!';
                      //   }
                      //   return null;
                      // },
                      // ),
                      SubjectField(
                        labelText: 'Subject',
                        hintText: 'Subject',
                        controller: _subject,
                        prefixIcon: Icons.subject,
                        maxlength: 30,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid input!';
                          }
                          return null;
                        },
                      ),
                      SubjectField(
                        labelText: 'Message',
                        controller: _message,
                        hintText: 'Write Your Message',
                        prefixIcon: Icons.message_outlined,
                        obscureText: false,
                        maxlines: 5,
                        maxlength: 500,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid input!';
                          }
                          return null;
                        },
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Submit_Button(
                        btntxt: 'Submit',
                        fontSize: 18,
                        ontouch: () async {
                          String res = await MessageMethod().createMsg(
                              subject: _subject.text,
                              message: _message.text,
                              userFname: userFname,
                              userLname: userLname,
                              userImg: userImg);
                          if (res == "Success") {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomePage()),
                                (route) => false);
                          } else {
                            showSnackBar(res, context);
                            // print('message.text');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Text(_subject.text),
              Text("subject.text")
            ],
          ),
        ),
      ),
    );
  }
}
