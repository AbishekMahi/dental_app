import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
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
            'Received',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Tab(
          child: Text(
            'Sent',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );

class _NotificationsState extends State<Notifications> {
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
            // centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Messages",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
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
              MsgSent(),
              MsgReceived(),
            ],
          ),
        ),
      ),
    );
  }
}

class MsgSent extends StatefulWidget {
  const MsgSent({super.key});

  @override
  State<MsgSent> createState() => _MsgSentState();
}

class _MsgSentState extends State<MsgSent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MsgReceived extends StatefulWidget {
  const MsgReceived({super.key});

  @override
  State<MsgReceived> createState() => _MsgReceivedState();
}

class _MsgReceivedState extends State<MsgReceived> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
