import 'package:dental_app/screens/booking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../utils/submit_button.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
            "About us",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 180,
                    ),
                  ),
                  // Lottie.asset('assets/lottie/tooth.json', width: 200),
                ),
                Text(
                  "Who We Are?",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF006DE9),
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Dental Care made those smiles perfect, took teeth back to their original, strong selves, gave teeth the care they deserve.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                "20k",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF006DE9),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Happy Smiles",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: const Color(0xD5202020),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                "16",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF006DE9),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Years Experience",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: const Color(0xD5202020),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                "14+",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF006DE9),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Working Hours",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: const Color(0xD5202020),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Submit_Button(
                    btntxt: 'Book Appointment',
                    fontSize: 22,
                    ontouch: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Booking(),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Who We Are Unique?",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF006DE9),
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Dental Care made those smiles perfect, took teeth back to their original, strong selves, gave teeth the care they deserve. \n\n Advanced smile makeovers, full mouth dental implants, zirconia and CAD CAM crowns, laser dentistry, invisible braces - we offer our patients the absolute best and latest in dental technology.\n\n We have our in house 3D CT scan ma chine, which ensures flawless accuracyWe have our in house 3D CT scan ma chine, which ensures flawless accuracy \n",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
