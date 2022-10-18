import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/screens/aboutus.dart';
import 'package:dental_app/screens/availability.dart';
import 'package:dental_app/screens/booking.dart';
import 'package:dental_app/screens/contact-page.dart';
import 'package:dental_app/screens/gallery.dart';
import 'package:dental_app/screens/appointments.dart';
import 'package:dental_app/screens/prescription.dart';
import 'package:dental_app/screens/profile.dart';
import 'package:dental_app/screens/services.dart';
import 'package:dental_app/screens/testimonials.dart';
import 'package:dental_app/screens/tips_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../utils/submit_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    // print(snap.data());
    setState(() {
      userFname = (snap.data() as Map<String, dynamic>)['first name'];
      userImg = (snap.data() as Map<String, dynamic>)['profileimg'];
    });
  }

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
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Dental Care",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
          ),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) => const ProfilePage(),
            //     //   ),
            //     // );
            //   },
            //   splashRadius: 26,
            //   icon: const Icon(
            //     Icons.notifications,
            //     color: Colors.yellow,
            //   ),
            //   iconSize: 32,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 10),
            //   child: IconButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const ProfilePage(),
            //         ),
            //       );
            //     },
            //     splashRadius: 26,
            //     icon: const Icon(
            //       Icons.account_circle,
            //       color: Colors.white,
            //     ),
            //     iconSize: 32,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: const AssetImage(
                    "assets/images/default-profile-pic.jpg",
                  ),
                  foregroundImage: NetworkImage(
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
                greetingMessage() + " " + userFname,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                // height: 200,
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 216, 255, 243),
                      Color.fromARGB(255, 245, 255, 253),
                    ],
                  ),
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
                      flex: 5,
                      child: Column(
                        children: [
                          Text(
                            'Dental Care',
                            // user.email!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                height: 0,
                                color: const Color(0xFF006DE9)),
                          ),
                          Text(
                            'Dental Care App helps dentists manage their patients and clinic.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
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
                          MaterialPageRoute(
                            builder: (context) => const AboutUs(),
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
                          MaterialPageRoute(
                            builder: (context) => const Services(),
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
                          MaterialPageRoute(
                            builder: (context) => const TipsPage(),
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
                          MaterialPageRoute(
                            builder: (context) => const Availability(),
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
                          MaterialPageRoute(
                            builder: (context) => const Testimonials(),
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
                          MaterialPageRoute(
                            builder: (context) => const Gallery(),
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
                          MaterialPageRoute(
                            builder: (context) => const History(),
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
                          MaterialPageRoute(
                            builder: (context) => const Prescriptions(),
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
                          MaterialPageRoute(
                            builder: (context) => const ContactUs(),
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
              height: 50,
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
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    ),
  );
}
