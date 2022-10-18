// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/resourses/auth_method.dart';
import 'package:dental_app/screens/authentications/login.dart';
import 'package:dental_app/screens/home-screen.dart';
import 'package:dental_app/utils/img_picker.dart';
import 'package:dental_app/utils/submit_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../utils/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  Uint8List? imageUrl;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    cpassword.dispose();
    fname.dispose();
    lname.dispose();
    phone.dispose();
    age.dispose();
    super.dispose();
  }

  void selectImg() async {
    Uint8List img = await pickImg(ImageSource.gallery);
    setState(() {
      imageUrl = img;
    });
  }

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Lottie.asset('assets/lottie/loading.json', width: 150),
            ),
          ),
        );
      },
    );
    if (passwordConfirmed()) {
      String res = await AuthMethods().signupUser(
        fname: fname.text,
        lname: lname.text,
        file: imageUrl!,
        email: email.text,
        password: password.text,
        cpassword: cpassword.text,
        age: age.text,
        phone: phone.text,
      );
      if (res != 'Success') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()),
            (route) => false);
        showSnackBar(res, context);
      } else {}
    }
  }

// Profile Pic Upload

  // void pickUploadImg() async {
  //   final image = await ImagePicker().pickImage(
  //   source: ImageSource.gallery,
  //   imageQuality: 75,
  //   maxHeight: 512,
  //   maxWidth: 512,
  // );
  //   Reference ref =
  //       FirebaseStorage.instance.ref().child("users_imgs/profilepic.jpg");
  //   await ref.putFile(File(image!.path));
  //   ref.getDownloadURL().then((value) {
  //     print(value);
  //     setState(() {
  //       imageUrl = value as Uint8List;
  //     });
  //   });
  // }

// Sign up and store Data to DB
  // Future signup() async {
  //   if (passwordConfirmed()) {
  //     try {
  //       var signup = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //           email: email.text.trim(), password: password.text.trim());
  // Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (_) => const HomePage()),
  //     (route) => false);
  //     } catch (e) {
  //       // print(e);
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             content: Text(
  //               e.toString(),
  //               textAlign: TextAlign.center,
  //               style: GoogleFonts.poppins(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w500,
  //                   height: 0,
  //                   color: Colors.black87),
  //             ),
  //           );
  //         },
  //       );
  //       // print(e);
  //     }
  //     addUserDetails(
  //       fname.text.trim(),
  //       lname.text.trim(),
  //       imageUrl,
  //       email.text.trim(),
  //       int.parse(age.text.trim()),
  //       int.parse(phone.text.trim()),
  //     );
  //   }
  // }

  // Future addUserDetails(String fname, String lname, Uint8List imageUrl,
  //     String email, int age, int phone) async {
  //   return await FirebaseFirestore.instance.collection('users').add({
  //     'first name': fname,
  //     'last name': lname,
  //     'email': email,
  //     'age': age,
  //     'imgUrl': imageUrl,
  //     'phone number': phone,
  //   });
  // }

// confirm Password
  bool passwordConfirmed() {
    if (password.text.trim() == cpassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Widget controlsBuilder(context, details) {
    final isLastStep = currentStep == stepList().length - 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currentStep != 0)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: details.onStepCancel,
                color: const Color(0xFF00C75A),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Back",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: details.onStepContinue,
              color: const Color(0xFF00C75A),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  isLastStep ? 'Submit' : 'Next',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF378CEC), Color(0xFF007EE6)],
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Color(0xFF00C75A))),
          child: Form(
            key: _formKey,
            child: Stepper(
              currentStep: currentStep,
              type: StepperType.horizontal,
              steps: stepList(),
              elevation: 0,
              controlsBuilder: controlsBuilder,
              onStepContinue: () {
                final isLastStep = currentStep == stepList().length - 1;

                if (isLastStep) {
                  print('Completed');
                  // send data to server
                  if (_formKey.currentState!.validate()) {
                    // signup();
                    signUp();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "You missed to fill something",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 0,
                                color: Colors.black87),
                          ),
                        );
                      },
                    );
                  }
                } else {
                  setState(() {
                    currentStep += 1;
                  });
                }

                setState(() {});
              },
              onStepCancel: () {
                if (currentStep == 0) {
                  return;
                }
                currentStep -= 1;
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }

  int currentStep = 0;
  List<Step> stepList() => [
        Step(
          state: currentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: currentStep >= 0,
          title: const Text("Details"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter your details',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: GestureDetector(
                  onTap: () {
                    // pickUploadImg();
                    selectImg();
                  },
                  child: imageUrl != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: MemoryImage(
                            imageUrl!,
                          ))
                      : const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/images/default-profile-pic.jpg',
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // name, age and phone number
              CustomTextField(
                labelText: 'First Name',
                hintText: 'First Name',
                prefixIcon: Icons.account_circle_outlined,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: fname,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              CustomTextField(
                labelText: 'Last name',
                hintText: 'Last Name',
                prefixIcon: Icons.account_circle_outlined,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: lname,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),

              CustomTextField(
                labelText: 'Phone number',
                hintText: 'Phone number',
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
              CustomTextField(
                labelText: 'Your age',
                hintText: 'Your age',
                prefixIcon: Icons.numbers_rounded,
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: age,
                maxlength: 2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Step(
          state: currentStep <= 1 ? StepState.editing : StepState.complete,
          isActive: currentStep >= 1,
          title: const Text("Create account"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Signup Here!',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              // Email or phone number
              CustomTextField(
                labelText: 'Email Address',
                hintText: 'abc@example.com',
                prefixIcon: Icons.mail_outline_rounded,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid input!';
                  }
                  return null;
                },
                controller: email,
              ),

              // password
              PasswordField(
                labelText: 'Password',
                hintText: 'Enter Password',
                prefixIcon: EvaIcons.lockOutline,
                keyvalue: 'password',
                controller: password,
              ),
              PasswordField(
                labelText: 'Confirm Password',
                hintText: 'Re-Enter password',
                prefixIcon: EvaIcons.lockOutline,
                keyvalue: 'cpassword',
                controller: cpassword,
              ),
              // Sign button
              // Submit_Button(
              //   btntxt: 'SIGN UP',
              //   fontSize: 22,
              //   ontouch: () {
              //     signUp();
              //   },
              // ),
              const SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Have an account?',
                    style:
                        GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                  ),
                  TextButton(
                    child: Text(
                      'Login Here!',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: currentStep >= 2,
          title: const Text("Confirm"),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Check Your Details Here',
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      height: 0,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: imageUrl != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: MemoryImage(
                            imageUrl!,
                          ))
                      : const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/images/default-profile-pic.jpg',
                          ),
                        ),
                ),
                Text(
                  'Full Name : ${fname.text} ${lname.text}',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Your Age : ${age.text}',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Phone Number : ${phone.text}',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Email : ${email.text}',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ];
}
