import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastAppoints extends StatefulWidget {
  const PastAppoints({super.key});

  @override
  State<PastAppoints> createState() => _PastAppointsState();
}

class _PastAppointsState extends State<PastAppoints> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class PastAppointContainer extends StatefulWidget {
  const PastAppointContainer({super.key});

  @override
  State<PastAppointContainer> createState() => _PastAppointContainerState();
}

class _PastAppointContainerState extends State<PastAppointContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 4),
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'July',
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '10',
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(221, 0, 158, 0),
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'WED',
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
              width: 1,
              child: Divider(
                color: Colors.black45,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Timing',
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '11:30 AM',
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                  width: 240,
                  child: Divider(
                    color: Colors.black45,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appointment Type',
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Loose Filling',
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
