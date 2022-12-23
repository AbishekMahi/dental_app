import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/screens/profile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../resourses/storage_method.dart';
import '../utils/img_picker.dart';
import '../utils/submit_button.dart';
import '../utils/textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String userFname = "";
  String userLname = "";
  String userAge = "";
  String userPhone = "";
  String userImg = "";
  Uint8List? imageUrl;
  final amount = TextEditingController(text: "1000");

  final fname = TextEditingController();
  final lname = TextEditingController();
  final age = TextEditingController();
  final phone = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // late Uint8List file;

  void pickUploadImg() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
      maxHeight: 512,
      maxWidth: 512,
    );
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profileimg/${_auth.currentUser!.uid}");
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((file) {
      print(file);
      setState(() {
        imageUrl = file as Uint8List;
      });
    });
  }

  void selectImg() async {
    Uint8List img = await pickImg(ImageSource.gallery);
    setState(() {
      imageUrl = img;
    });
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
      userPhone = (snap.data() as Map<String, dynamic>)['phone number'];
      userAge = (snap.data() as Map<String, dynamic>)['age'];
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
            "Edit Profile",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (() {
                    // pickUploadImg();
                    // selectImg();
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        backgroundImage: const AssetImage(
                          "assets/images/default-profile-pic.jpg",
                        ),
                        foregroundImage: CachedNetworkImageProvider(userImg),
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: Container(
                      //     padding: const EdgeInsets.all(5),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(18),
                      //       color: Colors.black54,
                      //     ),
                      //     child: const Icon(
                      //       Icons.camera_alt_rounded,
                      //       color: Colors.white,
                      //       size: 22,
                      //     ),
                      //   ),
                      // )
                    ]),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Edit Your Details:',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: Colors.black),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SubjectField(
                              key: Key(userFname.toString()),
                              // initialValue: userFname.toString(),
                              labelText: 'First Name',
                              // hintText: 'First Name',
                              hintText: userFname.toString(),
                              prefixIcon: Icons.person,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Invalid Phone number!';
                                }
                                return null;
                              },
                              controller: fname,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SubjectField(
                              key: Key(userLname.toString()),
                              // initialValue: userLname,
                              labelText: 'Last Name',
                              // hintText: 'Last name',
                              hintText: userLname.toString(),

                              prefixIcon: Icons.person,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Invalid Phone number!';
                                }
                                return null;
                              },
                              controller: lname,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SubjectField(
                              key: Key(userPhone.toString()),
                              // initialValue: userPhone.toString(),
                              labelText: 'Phone number',
                              // hintText: '+91 00000 00000',
                              hintText: userPhone.toString(),
                              prefixIcon: Icons.phone,
                              obscureText: false,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
                                        .hasMatch(value)) {
                                  return 'Invalid Phone number!';
                                }
                                return null;
                              },
                              controller: phone,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SubjectField(
                                key: Key(userAge.toString()),
                                // initialValue: userAge.toString(),
                                labelText: 'Age',
                                // hintText: 'Your age',
                                hintText: userAge.toString(),
                                prefixIcon: EvaIcons.calendar,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Invalid Phone number!';
                                  }
                                  return null;
                                },
                                controller: age),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Submit_Button(
                  btntxt: 'Save',
                  fontSize: 20,
                  ontouch: () async {
                    if (_formKey.currentState!.validate()) {
                      String message;
                      try {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          'first name': fname.text,
                          'last name': lname.text,
                          'age': age.text,
                          // 'profileimg': photoUrl,
                          'phone number': phone.text,
                          'last edited': FieldValue.serverTimestamp(),
                        });
                        message = 'Profile edited successfully';
                      } catch (e) {
                        message = 'Error when editing profile';
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
        ),
      ),
    );
  }
}
