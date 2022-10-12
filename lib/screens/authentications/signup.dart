import 'dart:math';
import 'package:dental_app/screens/authentications/login.dart';
import 'package:dental_app/screens/home-screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/submit_button.dart';
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

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    cpassword.dispose();
    super.dispose();
  }

  void signup() async {
    if (passwordConfirmed()) {
      try {
        var signup = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false);
      } catch (e) {
        print(e);
      }
    }
  }

  bool passwordConfirmed() {
    if (password.text.trim() == cpassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

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
        child: Stepper(
          currentStep: currentStep,
          type: StepperType.horizontal,
          onStepContinue: () {
            if (currentStep < (stepList().length - 1)) {
              currentStep += 1;
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
          steps: stepList(),
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
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              // Email or phone number
              const CustomTextField(
                labelText: 'First Name',
                hintText: 'First Name',
                prefixIcon: Icons.account_circle_outlined,
                obscureText: false,
                keyboardType: TextInputType.phone,
              ),
              const CustomTextField(
                labelText: 'Your age',
                hintText: 'Your age',
                prefixIcon: Icons.account_circle_outlined,
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
              const CustomTextField(
                labelText: 'Last name',
                hintText: 'Last Name',
                prefixIcon: Icons.account_circle_outlined,
                obscureText: false,
                keyboardType: TextInputType.phone,
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
                          builder: (context) => Login(),
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
          state: currentStep <= 1 ? StepState.editing : StepState.complete,
          isActive: currentStep >= 1,
          title: const Text("Create account"),
          content: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Signup Here!',
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Email or phone number
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                        labelText: 'Email Address',
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: 'Email Address',
                        hintStyle: const TextStyle(color: Colors.white70),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 227, 15, 0),
                            width: 2.0,
                          ),
                        ),
                        errorStyle: GoogleFonts.poppins(
                          color: const Color(0xFFC70D00),
                          fontSize: 15,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFC70D00),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid input!';
                        }
                        return null;
                      },
                    ),
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
                  Submit_Button(
                    btntxt: 'SIGN UP',
                    fontSize: 22,
                    ontouch: () {
                      signup();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Have an account?',
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.white),
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
                              builder: (context) => Login(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: currentStep >= 2,
          title: const Text("Confirm"),
          content: Container(),
        ),
      ];
}
