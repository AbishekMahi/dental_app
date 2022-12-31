import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AcceptedUserAppoints extends StatefulWidget {
  const AcceptedUserAppoints({super.key});

  @override
  State<AcceptedUserAppoints> createState() => _AcceptedUserAppointsState();
}

class _AcceptedUserAppointsState extends State<AcceptedUserAppoints> {
  String cdate = DateFormat("MM-dd-yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 80,
          image: AssetImage("assets/images/accepts.png"),
          // fit: BoxFit.cover
        ),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            // .collection('users')
            // .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('appointments')
            .where("appointed by",
                isEqualTo: FirebaseAuth.instance.currentUser!.email)
            .where('status', isEqualTo: 'approved')
            // .where('appointment date', isLessThan: cdate)
            // .orderBy('appointment date', descending: true)
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
            itemBuilder: (context, index) => AcceptedUserAppointContainer(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}

class AcceptedUserAppointContainer extends StatelessWidget {
  final snap;

  const AcceptedUserAppointContainer({super.key, this.snap});

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
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        // Text(
                        //   'Status',
                        //   style: GoogleFonts.poppins(
                        //       color: Colors.black87,
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w400),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
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
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 12,
                              height: 1.3,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.black45,
                    thickness: .5,
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
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            snap['appointment for'],
                            style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
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
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                snap['appointment date'],
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 14,
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
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                snap['appointment time'],
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(),
                  Container(),
                ],
              ),
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
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  snap['appointed time'],
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 12,
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
