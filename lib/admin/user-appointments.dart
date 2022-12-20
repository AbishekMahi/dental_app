import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class UserAppointments extends StatefulWidget {
  const UserAppointments({super.key});

  @override
  State<UserAppointments> createState() => _UserAppointmentsState();
}

class _UserAppointmentsState extends State<UserAppointments> {
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
          // centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Appointments",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: const UserAppoints(),
      ),
    );
  }
}

class UserAppoints extends StatefulWidget {
  const UserAppoints({super.key});

  @override
  State<UserAppoints> createState() => _UserAppointsState();
}

class _UserAppointsState extends State<UserAppoints> {
  String cdate = DateFormat("MM-dd-yyyy").format(DateTime.now());
  String tdata = DateFormat("hh:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 80,
          image: AssetImage("assets/images/upcoming.png"),
          // fit: BoxFit.cover
        ),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .where('status', isEqualTo: 'pending')
            // .orderBy('appointment date', descending: false)
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
            itemBuilder: (context, index) => UserAppointContainer(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
          //itemBuilder: (context, index) {
          //DocumentSnapshot ds = snapshot.data.docs[index];
          //print(ds.id);
          //return Text(ds['name']);
        },
      ),
    );
  }
}

class UserAppointContainer extends StatelessWidget {
  final snap;
  const UserAppointContainer({
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
        child: Stack(
          children: [
            Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        // width: 80,
                        child: Column(
                          children: [
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
                          // const SizedBox(
                          //   height: 10.0,
                          //   child: Divider(
                          //     color: Colors.black45,
                          //   ),
                          // ),
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
                      Container()
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black45,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // "By : ${snap['appointed by']}",
                        'By Abishek',
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        snap['appointed by'],
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
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
                    const VerticalDivider(
                      color: Colors.black87,
                      thickness: 1,
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
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        var collection = FirebaseFirestore.instance
                            .collection('appointments');
                        var docid = snap['appoint id'];
                        collection
                            .doc(docid)
                            .update({'status': "sorry not available"});
                      },
                      color: Colors.red.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.cancel_outlined,
                                color: Colors.white),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Reject",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
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
                        var collection = FirebaseFirestore.instance
                            .collection('appointments');
                        var docid = snap['appoint id'];
                        collection.doc(docid).update({'status': "approved"});
                      },
                      color: Colors.green.shade600,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle_outline_outlined,
                                color: Colors.white),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Accept",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
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
          ],
        ),
      ),
    );
  }
}
