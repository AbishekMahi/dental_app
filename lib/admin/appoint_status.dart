import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/admin/accepted_appoints.dart';
import 'package:dental_app/admin/rejected_appoints.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointStatus extends StatefulWidget {
  const AppointStatus({super.key});

  @override
  State<AppointStatus> createState() => _AppointStatusState();
}

TabBar get tabBar => TabBar(
      // isScrollable: true,
      labelColor: const Color(0xFF378CEC),
      indicatorColor: const Color(0xFF007EE6),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 4,
      unselectedLabelColor: Colors.black87,
      tabs: [
        Tab(
          child: Text(
            'Accepted',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Tab(
          child: Text(
            'Rejected',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );

class _AppointStatusState extends State<AppointStatus> {
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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Appointments Status",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            bottom: PreferredSize(
              preferredSize: tabBar.preferredSize,
              child: ColoredBox(
                color: Colors.white,
                child: tabBar,
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              AcceptedAppoints(),
              RejectedAppoints(),
            ],
          ),
        ),
      ),
    );
  }
}
