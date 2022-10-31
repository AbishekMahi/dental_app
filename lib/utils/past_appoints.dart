import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/utils/upcoming_appoints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PastAppoints extends StatefulWidget {
  const PastAppoints({super.key});

  @override
  State<PastAppoints> createState() => _PastAppointsState();
}

class _PastAppointsState extends State<PastAppoints> {
  String cdate = DateFormat("MM-dd-yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 80,
          image: AssetImage("assets/images/old.png"),
          // fit: BoxFit.cover
        ),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('appointments')
            .where('appointment date', isLessThan: cdate)
            .orderBy('appointment date', descending: true)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PastAppointContainer(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}

class PastAppointContainer extends StatelessWidget {
  final snap;
  const PastAppointContainer({
    super.key,
    this.snap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 4),
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Status',
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset(
                          "assets/images/${snap['status']}.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        snap['status'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                  width: 1,
                  child: Divider(
                    color: Colors.black45,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Appointment For',
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          snap['appointment for'],
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                      width: 250,
                      child: Divider(
                        color: Colors.black45,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date :',
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              snap['appointment date'],
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Timing :',
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              snap['appointment time'],
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.black45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amount : ₹ ${snap['amount paid']}",
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  snap['appointed time'],
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
