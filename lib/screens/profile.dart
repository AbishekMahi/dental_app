import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/screens/authentications/welcome.dart';
import 'package:dental_app/screens/booking.dart';
import 'package:dental_app/screens/edit-profile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/submit_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userFname = "";
  String userLname = "";
  String userAge = "";
  String userPhone = "";
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
      userPhone = (snap.data() as Map<String, dynamic>)['phone number'];
      userAge = (snap.data() as Map<String, dynamic>)['age'];
      userImg = (snap.data() as Map<String, dynamic>)['profileimg'];
    });
  }

// Profile Pic Upload
  // String imageUrl = "";
  // void pickUploadImg() async {
  //   final image = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     imageQuality: 75,
  //     maxHeight: 512,
  //     maxWidth: 512,
  //   );
  //   Reference ref = FirebaseStorage.instance.ref().child("profilepic.jpg");
  //   await ref.putFile(File(image!.path));
  //   ref.getDownloadURL().then((value) {
  //     print(value);
  //     setState(() {
  //       imageUrl = value;
  //     });
  //   });
  // }

  final user = FirebaseAuth.instance.currentUser!;
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
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Profile",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  // height: 140,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          // opacity: 50,
                          image: AssetImage("assets/images/back.png"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: GestureDetector(
                          onTap: () {
                            // pickUploadImg();
                          },
                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(50),
                          //   child: imageUrl == ""
                          //       ? Image.asset(
                          //           'assets/images/default-profile-pic.jpg',
                          //           fit: BoxFit.cover,
                          //         )
                          //       : ExtendedImage.network(
                          //           imageUrl,
                          //           fit: BoxFit.cover,
                          //           cache: true,
                          //         ),
                          // ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: const AssetImage(
                              "assets/images/default-profile-pic.jpg",
                            ),
                            foregroundImage:
                                CachedNetworkImageProvider(userImg),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Text(
                      //       userFname,
                      //       textAlign: TextAlign.center,
                      //       style: GoogleFonts.poppins(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w500,
                      //         height: 0,
                      //       ),
                      //     ),
                      //     Text(
                      //       user.email!,
                      //       textAlign: TextAlign.center,
                      //       style: GoogleFonts.poppins(
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.w400,
                      //         height: 0,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Your Details:',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: Colors.black),
                        ),
                      ),
                      Column(
                        children: [
                          CustomProfileWidget(
                            title: 'Full Name',
                            subtitle: '$userFname $userLname',
                            icon: const Icon(
                              Icons.person,
                              size: 24,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          CustomProfileWidget(
                            title: 'Email Address',
                            subtitle: user.email!,
                            icon: const Icon(
                              Icons.mail_rounded,
                              size: 24,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          CustomProfileWidget(
                            title: 'Phone Number',
                            subtitle: userPhone,
                            icon: const Icon(
                              Icons.phone,
                              size: 24,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          CustomProfileWidget(
                            title: 'Age',
                            subtitle: userAge,
                            icon: const Icon(
                              EvaIcons.calendar,
                              size: 24,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          CustomProfileWidget(
                            title: 'User id',
                            subtitle: user.uid,
                            icon: const Icon(
                              EvaIcons.hash,
                              size: 24,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: () async {
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
                                                      const EdgeInsets.only(
                                                          right: 8),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    color: Colors.grey.shade700,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "No",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 0,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                MaterialButton(
                                                  onPressed: () {
                                                    FirebaseAuth.instance
                                                        .signOut();
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                            Icons
                                                                .logout_outlined,
                                                            color:
                                                                Colors.white),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "Yes",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  height: 0,
                                                                  color: Colors
                                                                      .white),
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
                              color: Colors.red.shade400,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.logout_outlined,
                                        color: Colors.white),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Logout",
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
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EditProfile(),
                                  ),
                                );
                              },
                              color: Colors.grey.shade700,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit, color: Colors.white),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Edit",
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
                      )
                    ],
                  ),
                ),
                // Submit_Button(
                //   btntxt: 'Book Appointment',
                //   fontSize: 20,
                //   ontouch: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const Booking(),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomProfileWidget extends StatelessWidget {
  const CustomProfileWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon})
      : super(key: key);
  final String title;
  final String subtitle;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 5,
      iconColor: Colors.black54,
      leading: icon,
      title: Text(
        title,
        style: GoogleFonts.poppins(
            color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
      subtitle: Flexible(
        child: Text(
          subtitle,
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
