import 'package:dental_app/screens/authentications/login.dart';
import 'package:dental_app/screens/authentications/welcome.dart';
import 'package:dental_app/screens/booking.dart';
import 'package:extended_image/extended_image.dart';
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
  final user = FirebaseAuth.instance.currentUser!;
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
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Profile",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 85,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: ExtendedImage.network(
                            'https://myabilitieswa.com.au/wp-content/uploads/2017/06/default-profile-pic-e1513291410505.jpg',
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            user.email!,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
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
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              color: Colors.black),
                        ),
                      ),
                      Column(
                        children: const [
                          CustomProfileWidget(
                            title: 'Full Name',
                            subtitle: 'Madhan Kumar',
                            icon: Icon(
                              Icons.person,
                              size: 24,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          CustomProfileWidget(
                            title: 'Phone Number',
                            subtitle: '9867405231',
                            icon: Icon(
                              Icons.phone,
                              size: 24,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          CustomProfileWidget(
                            title: 'Age',
                            subtitle: 'Software Engineer',
                            icon: Icon(
                              Icons.numbers,
                              size: 24,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Welcome(),
                                  ),
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              color: const Color.fromARGB(255, 100, 100, 100),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit, color: Colors.white),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Edit Details",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
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
                Submit_Button(
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
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
      subtitle: Flexible(
        child: Text(
          subtitle,
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
