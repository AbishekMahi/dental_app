import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resourses/message_method.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _phone = Uri.parse('tel:+918552085521');
final Uri _email = Uri.parse('mailto:kiruvin4@gmail.com');

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

void _launchPhone() async {
  if (!await launchUrl(_phone)) throw 'Could not launch $_phone';
}

void _launchMail() async {
  if (!await launchUrl(_email)) throw 'Could not launch $_email';
}

class _ContactUsState extends State<ContactUs> {
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
            "Contact Us",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                // height: 200,
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      // opacity: 50,
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
                          CachedNetworkImage(
                            imageUrl:
                                'http://saistoothcare.com/images/logoclr.png',
                            height: 25,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'SAI\'s Tooth Care is the most trusted dental clinic in Chennai, aiming to bring world',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 0,
                              // color:
                              color: const Color(0xBD1B1B1B),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Text(
                                '~ Dr. Indhumathy MDS',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    // height: 0,
                                    color: const Color(0xFF006DE9)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: CachedNetworkImage(
                          height: 180,
                          imageUrl:
                              'https://i.postimg.cc/J0d4DXv7/Untitled-design.png',
                          fit: BoxFit.fitHeight,
                        )
                        // Lottie.asset('assets/lottie/dental-clinic.json'),
                        ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: (_launchPhone),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(2, 8),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      color: Color(0xFF006DE9),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Call Us:',
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF006DE9),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '+91 82563 45323',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF181818),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5, 10, 15, 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: (_launchMail),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 4),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.mail,
                                      color: Color(0xFF006DE9),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Mail Us:',
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF006DE9),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'hello@dental.com',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF181818),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const MsgForm(),
            ],
          ),
        ),
      ),
    );
  }
}
