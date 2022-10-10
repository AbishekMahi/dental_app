import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../utils/submit_button.dart';
import '../utils/textfield.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _phone = Uri.parse('tel:+918270514004');
final Uri _email = Uri.parse('mailto:abishekmas0708@gmail.com');

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
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                height: 200,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 4),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Lottie.asset('assets/lottie/contact.json'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 10, 10),
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
                                          fontSize: 18,
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
                                      fontSize: 16,
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
                      margin: const EdgeInsets.fromLTRB(0, 10, 15, 10),
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'hello@dentalcare.com',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF181818),
                                      fontSize: 14,
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
              Container(
                margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                // height: 200,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Send Your Message:',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            height: 0,
                            color: const Color(0xFF006DE9)),
                      ),
                    ),
                    SubjectField(
                      labelText: 'Email Address',
                      hintText: 'Email Address',
                      prefixIcon: Icons.account_circle_outlined,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid input!';
                        }
                        return null;
                      },
                    ),
                    const SubjectField(
                      labelText: 'Subject',
                      hintText: 'Subject',
                      prefixIcon: Icons.subject,
                      obscureText: false,
                    ),
                    const SubjectField(
                      labelText: 'Message',
                      hintText: 'Write Your Message',
                      prefixIcon: Icons.message_outlined,
                      obscureText: false,
                      maxlines: 4,
                    ),
                    Submit_Button(
                      btntxt: 'Submit',
                      fontSize: 22,
                      ontouch: () {
                        // _submit();
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomePage(),
                        //   ),
                        // );
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
