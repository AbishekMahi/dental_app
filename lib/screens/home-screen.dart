import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/admin/admin-home.dart';
import 'package:dental_app/screens/aboutus.dart';
import 'package:dental_app/screens/availability.dart';
import 'package:dental_app/screens/booking.dart';
import 'package:dental_app/screens/contact-page.dart';
import 'package:dental_app/screens/gallery.dart';
import 'package:dental_app/screens/appointments.dart';
import 'package:dental_app/screens/notifications.dart';
import 'package:dental_app/screens/prescription.dart';
import 'package:dental_app/screens/services.dart';
import 'package:dental_app/screens/testimonials.dart';
import 'package:dental_app/screens/tips_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../utils/menu_list.dart';
import '../utils/submit_button.dart';
import 'package:page_transition/page_transition.dart';

class DecideHome extends StatefulWidget {
  DecideHome({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  State<DecideHome> createState() => _DecideHomeState();
}

class _DecideHomeState extends State<DecideHome> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Scaffold(
                body: Center(
              child: Lottie.asset('assets/lottie/loading.json', width: 150),
            ));
          default:
            return checkRole(snapshot.data!);
        }
      },
    );
  }

  Widget checkRole(DocumentSnapshot snapshot) {
    if (snapshot.get('role') == 'Admin') {
      return const AdminHome();
    } else {
      return const HomePage();
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;
  String userImg = "";
  String userFname = "";

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  String greetingMessage() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return 'Good Morning!';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon!';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening!';
    } else {
      return 'Good Night!';
    }
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      userFname = (snap.data() as Map<String, dynamic>)['first name'];
      userImg = (snap.data() as Map<String, dynamic>)['profileimg'];
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
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Sai's Tooth Care",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notifications(),
                    ),
                  );
                },
                splashRadius: 26,
                icon: const Icon(
                  Icons.mail_outline_rounded,
                ),
                iconSize: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  _scaffoldkey.currentState!.openEndDrawer();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: const AssetImage(
                    "assets/images/default-profile-pic.jpg",
                  ),
                  foregroundImage: CachedNetworkImageProvider(
                    userImg,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                "${greetingMessage()} $userFname",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminHome(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        opacity: 50,
                        image: AssetImage("assets/images/back.png"),
                        fit: BoxFit.fill),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 4),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Text(
                              'Welcome',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  color: const Color(0xFF006DE9)),
                            ),
                            Text(
                              'SAI\'s Tooth Care is the most trusted dental clinic in Chennai, aiming to bring world class dental care within reach of everyone.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  color: const Color(0xBD1B1B1B)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Lottie.asset('assets/lottie/dental-clinic.json'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 15, left: 15, bottom: 15),
                child: GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount: 3,
                  children: [
                    ExtraFeatures(
                      imageUrl: 'assets/images/doctor.png',
                      title: 'About us',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const AboutUs(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/tooth.png',
                      title: 'Services',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const Services(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/appointment.png',
                      title: 'Our Tips',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const TipsPage(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/gallery.png',
                      title: 'Gallery',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const Gallery(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/blog.png',
                      title: 'Appointments',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const History(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/pin.png',
                      title: 'Prescriptions',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const Prescriptions(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/calendar.png',
                      title: 'Availability',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const Availability(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/testimony.png',
                      title: 'Testimonials',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const Testimonials(),
                          ),
                        );
                      },
                    ),
                    ExtraFeatures(
                      imageUrl: 'assets/images/phone.png',
                      title: 'Contact',
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const ContactUs(),
                          ),
                        );
                      },
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const Booking(),
                    //   ),
                    // );
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: const Booking(),
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
              height: 45,
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
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    ),
  );
}
