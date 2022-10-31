import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAppointments extends StatefulWidget {
  const UserAppointments({super.key});

  @override
  State<UserAppointments> createState() => _UserAppointmentsState();
}

class _UserAppointmentsState extends State<UserAppointments> {
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
          // centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Appointments",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
