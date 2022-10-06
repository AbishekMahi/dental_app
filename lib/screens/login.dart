import 'package:dental_app/screens/home-screen.dart';
import 'package:dental_app/screens/signup.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../utils/submit_button.dart';
import '../utils/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
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
              padding: const EdgeInsets.all(10),
              reverse: true,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Lottie.asset('assets/lottie/login.json', width: 180),
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
                    CustomTextField(
                      labelText: 'Email Address',
                      hintText: 'Email Address',
                      prefixIcon: Icons.account_circle_outlined,
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
                    ),
                    // password
                    const PasswordField(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      prefixIcon: EvaIcons.lockOutline,
                    ),
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
                            builder: (context) => forgetPassword(),
                          ),
                        );
                      },
                    ),
                    // Sign button
                    Submit_Button(
                      btntxt: 'SIGN IN',
                      fontSize: 22,
                      ontouch: () {
                        _submit();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
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
    );
  }

  forgetPassword() {}
}
