// ignore_for_file: use_build_context_synchronously

import 'package:dental_app/resourses/auth_method.dart';
import 'package:dental_app/screens/authentications/reset-password.dart';
import 'package:dental_app/screens/authentications/signup.dart';
import 'package:dental_app/screens/home-screen.dart';
import 'package:dental_app/utils/submit_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../utils/img_picker.dart';
import '../../utils/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void loginUser() async {
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
    String res = await AuthMethods().loginUser(
      email: email.text,
      password: password.text,
    );
    if (res == "Success") {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()),
          (route) => false);
    } else {
      //
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF378CEC), Color(0xFF007EE6)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login Here!',
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
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                      ),

                      PasswordField(
                        controller: password,
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        prefixIcon: EvaIcons.lockOutline,
                        keyvalue: 'password',
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              'Forgot password?',
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      // Sign button
                      Submit_Button(
                        btntxt: 'SIGN IN',
                        fontSize: 22,
                        ontouch: () {
                          if (_formKey.currentState!.validate()) {
                            loginUser();
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

                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'New User?',
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.white),
                          ),
                          TextButton(
                            child: Text(
                              'Register Here!',
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
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
          ),
        ),
      ),
    );
  }
}

//   void login() async {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Center(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Lottie.asset('assets/lottie/loading.json', width: 150),
//             ),
//           ),
//         );
//       },
//     );
//     // Navigator.of(context).pop();
//     try {
//       var signup = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email.text.trim(), password: password.text.trim());
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (_) => const HomePage(),
//           ),
//           (route) => false);
//     } catch (e) {
//       print(e);
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
//     }
//   }
// }
