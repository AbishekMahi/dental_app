import 'package:dental_app/admin/accepted_appoints.dart';
import 'package:dental_app/admin/appoint_status.dart';
import 'package:dental_app/admin/messages_recived.dart';
import 'package:dental_app/admin/user-appointments.dart';
import 'package:dental_app/admin/users-list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Admin Panel",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                "Welcome Back Admin!",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                  children: [
                    ExtraFeatures(
                      imageUrl: 'assets/images/users.png',
                      title: 'User Details',
                      ontouch: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserBios(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/msgs.png',
                      title: 'Messages',
                      ontouch: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Messages(),
                          ),
                        );
                      },
                    ),
                    // ExtraFeatures(
                    //   imageUrl: 'assets/images/invoice.png',
                    //   title: 'Invoices',
                    //   ontouch: () {},
                    // ),
                  ],
                ),
              ),
              Text(
                "Appointments",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                  children: [
                    ExtraFeatures(
                      imageUrl: 'assets/images/appointments.png',
                      title: 'New Appointments',
                      ontouch: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserAppointments(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/status.png',
                      title: 'Appointments Status',
                      ontouch: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppointStatus(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/invoice.png',
                      title: 'Invoices',
                      ontouch: () {},
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/sorry not available.png',
                      title: 'Rejected',
                      ontouch: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ExtraFeatures({
  required String title,
  required String imageUrl,
  required void Function() ontouch,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: ontouch,
    child: Ink(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(2, 8),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              imageUrl,
              height: 65,
            ),
          ),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.poppins(
                  height: 1.1,
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    ),
  );
}
