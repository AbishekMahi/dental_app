import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/img_picker.dart';
import '../utils/submit_button.dart';
import '../utils/textfield.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  static const List<String> list = <String>[
    'Male',
    'Female',
  ];
  final GlobalKey<FormState> _formKey = GlobalKey();
  String dropdownValue = list.first;
  String userFname = "";
  String userLname = "";
  String userAge = "";
  String userPhone = "";
  String userImg = "";
  String userGender = "";
  String userDob = "";
  Uint8List? imageUrl;

  final amount = TextEditingController(text: "1000");
  final fname = TextEditingController();
  final lname = TextEditingController();
  final phone = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    getUserName();
    super.initState();
  }

  void getDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2005),
        firstDate: DateTime(1900),
        lastDate: DateTime(2006));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);
      setState(() {
        dateinput.text = formattedDate;
        // dateinput.text = formattedDate;
      });
    } else {}
  }

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

  // @override
  // void initState() {
  //   super.initState();
  //   getUserName();
  // }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      userFname = (snap.data() as Map<String, dynamic>)['first name'];
      userLname = (snap.data() as Map<String, dynamic>)['last name'];
      userPhone = (snap.data() as Map<String, dynamic>)['phone number'];
      userDob = (snap.data() as Map<String, dynamic>)['dob'];
      userGender = (snap.data() as Map<String, dynamic>)['gender'];
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
                              hintText: '$userFname (First Name)',
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
                              readOnly: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SubjectField(
                              key: Key(userLname.toString()),
                              hintText: '$userLname (Last Name)',
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
                              readOnly: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SubjectField(
                              key: Key(userPhone.toString()),
                              hintText: '$userPhone (Mobile Number)',
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
                              readOnly: false,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SubjectField(
                              hintText: '$userDob (Select DOB)',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Select Date';
                                }
                              },
                              controller: dateinput,
                              prefixIcon: Icons.cake,
                              onTap: () {
                                getDate();
                              },
                              obscureText: false,
                              readOnly: true,
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 13),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black87),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    dropdownValue == 'Male'
                                        ? Icons.male_outlined
                                        : Icons.female_outlined,
                                    color: Colors.black87,
                                  ),
                                  focusColor: Colors.black,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                value: dropdownValue,
                                // isExpanded: false,
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  size: 25,
                                  // color: Colors.white,
                                ),
                                // elevation: 16,
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    // value: 'Gender',
                                    child: Text(
                                      value,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  );
                                }).toList(),
                              ),
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
                          'dob': dateinput.text,
                          'gender': dropdownValue,
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
