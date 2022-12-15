import 'package:dental_app/screens/booking.dart';
import 'package:dental_app/utils/upcoming_appoints.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/old_appoints.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
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
            'UPCOMING',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Tab(
          child: Text(
            'OLD',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );

class _HistoryState extends State<History> {
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
              "Appointments",
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
          floatingActionButton: FloatingActionButton(
            tooltip: 'Book appointment',
            backgroundColor: const Color(0xFF00C75A),
            child: const Icon(
              Icons.add,
              size: 32,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Booking(),
                ),
              );
            },
          ),
          body: const TabBarView(
            children: [
              UpcomingAppoints(),
              PastAppoints(),
            ],
          ),
        ),
      ),
    );
  }
}
