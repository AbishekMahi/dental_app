import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/screens/edit-profile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/authentications/welcome.dart';
import '../screens/profile.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final user = FirebaseAuth.instance.currentUser!;
  String userFname = "";
  String userLname = "";
  String userImg = "";
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
      userLname = (snap.data() as Map<String, dynamic>)['last name'];
      userImg = (snap.data() as Map<String, dynamic>)['profileimg'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            ),
            child: DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF378CEC), Color(0xFF007EE6)],
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.grey,
                    backgroundImage: const AssetImage(
                      "assets/images/default-profile-pic.jpg",
                    ),
                    foregroundImage: CachedNetworkImageProvider(userImg),
                    // backgroundImage: AssetImage('assets/images/man.jpg'),
                    // backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    userFname,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    user.email!,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Column(
                children: [
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Icon(
                      Icons.person_outline_rounded,
                      color: Color(0xC9000000),
                    ),
                    title: Text(
                      'Account',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: const Color(0xC9000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    ),
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Icon(
                      Icons.mode_edit_outline_outlined,
                      color: Color(0xC9000000),
                    ),
                    title: Text(
                      'Edit Profile',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: const Color(0xC9000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      ),
                    ),
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Icon(
                      EvaIcons.settings2Outline,
                      color: Color(0xC9000000),
                    ),
                    title: Text(
                      'Settings',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: const Color(0xC9000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Icon(
                      Icons.feedback_outlined,
                      color: Color(0xC9000000),
                    ),
                    title: Text(
                      'Feedbacks',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: const Color(0xC9000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () async {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'kiruvin4@gmail.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Feedback - Sai\'s Tooth Care App',
                        }),
                      );
                      launchUrl(emailLaunchUri);
                    },
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Icon(
                      Icons.bug_report_outlined,
                      color: Color(0xC9000000),
                    ),
                    title: Text(
                      'Report Bugs',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: const Color(0xC9000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Icon(
                      Icons.star_rate_outlined,
                      color: Color(0xC9000000),
                    ),
                    title: Text(
                      'Rate Us',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: const Color(0xC9000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Icon(
                      Icons.info_outline_rounded,
                      color: Color(0xC9000000),
                    ),
                    title: Text(
                      'About',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: const Color(0xC9000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    // onTap: () async {
                    //   String url =
                    //       "https://abishekmahi.github.io/sais-dental-clinic";
                    //   if (await canLaunch(url)) {
                    //     await launch(url, forceSafariVC: false);
                    //   } else {
                    //     print('not supported');
                    //   }
                    // },
                    onTap: () async {
                      String url = "https://saistoothcare.com/";
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: true,
                          forceWebView: true,
                          enableJavaScript: true,
                          enableDomStorage: true,
                          webOnlyWindowName: '_self',
                        );
                      } else {
                        print('not supported');
                      }
                    },
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Icon(
                      EvaIcons.logOutOutline,
                      color: Color(0xC9000000),
                    ),
                    title: Text(
                      'Logout',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: const Color(0xC9000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Are you Sure?',
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  // fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            content: SizedBox(
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Do you really want to Logout?',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          color: Colors.grey.shade700,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "No",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          FirebaseAuth.instance.signOut();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Welcome(),
                                            ),
                                          );
                                        },
                                        color: Colors.red.shade400,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.logout_outlined,
                                                  color: Colors.white),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Yes",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
            child: Divider(
              color: Colors.black45,
            ),
          ),
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: 'http://saistoothcare.com/images/logoclr.png',
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'App Version - v 1.0.0',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: const Color(0xC9000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
            child: Divider(
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
