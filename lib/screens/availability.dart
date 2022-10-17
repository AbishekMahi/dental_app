import 'package:dental_app/screens/booking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../utils/submit_button.dart';
import '../utils/textfield.dart';

class Availability extends StatefulWidget {
  const Availability({super.key});

  @override
  State<Availability> createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            "Availability",
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
                height: 220,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(110),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 4),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Lottie.asset('assets/lottie/calendar.json'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'We are available on',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          color: const Color(0xFF006DE9),
                        ),
                      ),
                    ),
                    AvailTime(
                        day: 'Monday',
                        mortime: "09:00 AM - 12:00 PM",
                        evetime: "01:30 AM - 07:00 PM"),
                    const Divider(),
                    AvailTime(
                        day: 'Tuesday',
                        mortime: "09:00 AM - 12:00 PM",
                        evetime: "01:30 AM - 07:00 PM"),
                    const Divider(),
                    AvailTime(
                        day: 'Wednesday',
                        mortime: "09:00 AM - 12:00 PM",
                        evetime: "01:30 AM - 07:00 PM"),
                    const Divider(),
                    AvailTime(
                        day: 'Thursday',
                        mortime: "09:00 AM - 12:00 PM",
                        evetime: "01:30 AM - 07:00 PM"),
                    const Divider(),
                    AvailTime(
                        day: 'Friday',
                        mortime: "09:00 AM - 12:00 PM",
                        evetime: "01:30 AM - 07:00 PM"),
                    const Divider(),
                    AvailTime(
                        day: 'Saturday',
                        mortime: "09:00 AM - 12:00 PM",
                        evetime: "01:30 AM - 07:00 PM"),
                    const Divider(),
                    AvailTime(day: 'Sunday', mortime: "Holiday", evetime: ""),
                    const SizedBox(
                      height: 5,
                    )
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget AvailTime({
  required String day,
  required String mortime,
  required String evetime,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            day,
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 0,
              color: const Color(0xFF202020),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Text(
                mortime,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  color: const Color(0xD5202020),
                ),
              ),
              Text(
                evetime,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  color: const Color(0xD5202020),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
