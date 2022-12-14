import 'package:dental_app/screens/authentications/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/submit_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262525),
      body: Container(
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
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Sai\'s Tooth Care',
                      style: GoogleFonts.poppins(
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              // page1
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lottie/tooth.json', width: 250),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Welcome',
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Sai\'s Tooth Care App helps dentists manage their patients and clinic. Dentists can keep a database of their patient\'s record.',
                      style: GoogleFonts.poppins(
                          fontSize: 18, height: 1.5, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              // Get started button
              Submit_Button(
                btntxt: 'GET STARTED',
                fontSize: 20,
                ontouch: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
