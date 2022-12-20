import 'package:cached_network_image/cached_network_image.dart';
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
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 40),
                      child: CachedNetworkImage(
                        imageUrl: 'http://saistoothcare.com/images/logoclr.png',
                        // height: 180,
                      )
                      // Image.asset(
                      //   "assets/images/logo.png",
                      // ),
                      ),
                  // Lottie.asset('assets/lottie/tooth.json', width: 200),
                ),
                Text(
                  "Who We Are?",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF006DE9),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "SAI's Tooth Care is the most trusted dental clinic in Chennai, aiming to bring world class dental care within reach of everyone.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 14,
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
                                "10k",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF006DE9),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Happy Smiles",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: const Color(0xD5202020),
                                    fontSize: 14,
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
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Years Experience",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: const Color(0xD5202020),
                                    fontSize: 14,
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
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Working Hours",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: const Color(0xD5202020),
                                    fontSize: 14,
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
                    fontSize: 20,
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
                  "Welcome To Multispeciality Dental Care.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF006DE9),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "\nProviding the best of ambience, technological advancement and evidence based updated treatments, our clinic are equipped with the latest and most ergonomic Dental Chairs, Lasers, Dental Implants, branded consumables and Digital X-rays. \n\n At Sai's tooth care, we are passionate about providing our patients with a delightful experience with all treatments. Our staffs strive to build the patient's trust and are always ready to answer your queries. After examining and understanding your concerns, our dentists provide personal communication to demonstrate the entire treatment procedures from our dental doctors before the treatment.\n\n Ethical Practice and working with utmost care for patient's health and happiness has been the secret of success.\n",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 14,
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

// At Sai's tooth care, we are passionate about providing our patients with a delightful experience with all treatments. Our staffs strive to build the patient's trust and are always ready to answer your queries. After examining and understanding your concerns, our dentists provide personal communication to demonstrate the entire treatment procedures from our dental doctors before the treatment.

// Ethical Practice and working with utmost care for patient's health and happiness has been the secret of success.