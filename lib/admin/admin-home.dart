import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/admin/admin_lists.dart';
import 'package:dental_app/admin/appoint_status.dart';
import 'package:dental_app/admin/messages_recived.dart';
import 'package:dental_app/admin/payments.dart';
import 'package:dental_app/admin/user-appointments.dart';
import 'package:dental_app/admin/users-list.dart';
import 'package:dental_app/admin/web_appointments.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/menu_list.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final user = FirebaseAuth.instance.currentUser!;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  String userFname = "";
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    // print(snap.data());
    setState(() {
      userFname = (snap.data() as Map<String, dynamic>)['first name'];
    });
  }

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
        key: _scaffoldkey,
        endDrawer: const MenuList(),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          elevation: 0,
          // backgroundColor: Colors.transparent,
          actions: [
            StatefulBuilder(
              builder: (BuildContext context, setState) {
                return IconButton(
                  splashRadius: 26,
                  icon: const Icon(
                    EvaIcons.menu2,
                  ),
                  iconSize: 32,
                  onPressed: () {
                    _scaffoldkey.currentState!.openEndDrawer();
                  },
                );
              },
            )
          ],
          title: Text(
            "Admin Panel",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                "Welcome Back $userFname!",
                style: GoogleFonts.poppins(
                    fontSize: 18,
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
                    Hero(
                      tag: 'users',
                      child: ExtraFeatures(
                        imageUrl: 'assets/images/users.png',
                        title: 'Users',
                        ontouch: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const UserBios(),
                            ),
                          );
                        },
                      ),
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/admin.png',
                      title: 'Admins',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const AdminBio(),
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
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const Messages(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/rupee.png',
                      title: 'Payments',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const Payments(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Text(
                "Appointments",
                style: GoogleFonts.poppins(
                    fontSize: 18,
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
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const UserAppointments(),
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
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const AppointStatus(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/web.png',
                      title: 'Web Appointments',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const WebAppoints(),
                          ),
                        );
                      },
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
              height: 60,
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
