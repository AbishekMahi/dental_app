import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PendingUserAppoints extends StatefulWidget {
  const PendingUserAppoints({super.key});

  @override
  State<PendingUserAppoints> createState() => _PendingUserAppointsState();
}

class _PendingUserAppointsState extends State<PendingUserAppoints> {
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
            // .collection('users')
            // .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('appointments')
            .where("appointed by",
                isEqualTo: FirebaseAuth.instance.currentUser!.email)
            .where('status', isEqualTo: 'pending')
            // .where('appointment date', isGreaterThanOrEqualTo: cdate)
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
              itemBuilder: (context, index) {
                Map<String, dynamic> snap =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return PendingUserAppointsContainer(
                  snap: snap,
                );
              }
              // => PendingUserAppointsContainer(
              //   snap: snapshot.data!.docs[index].data(),
              // itemBuilder: (context, index) => PendingUserAppointsContainer(
              //   snap: snapshot.data!.docs[index].data(),
              );
        },
      ),
    );
  }
}

class PendingUserAppointsContainer extends StatelessWidget {
  final snap;
  const PendingUserAppointsContainer({
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
            Positioned(
              top: -10,
              right: -10,
              child: IconButton(
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
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text(
                                  'Do you really want to delete the appointment?',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
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
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  MaterialButton(
                                    // onPressed: () {
                                    //   var collection = FirebaseFirestore
                                    //       .instance
                                    //       .collection('appointments');
                                    //   collection
                                    //       .doc(
                                    //           '13Dec20220336PM') // <-- Doc ID to be deleted.
                                    //       .delete();
                                    // },
                                    onPressed: () {
                                      var collection = FirebaseFirestore
                                          .instance
                                          .collection('appointments');
                                      var docid = snap['appoint id'];
                                      collection.doc(docid).delete();
                                    },
                                    color: Colors.red.shade400,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.delete,
                                              color: Colors.white),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Yes",
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
                        ),
                      );
                    },
                  );
                },
                splashRadius: 26,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                iconSize: 28,
              ),
            ),
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
                          //   height: 20.0,
                          //   width: 250,
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
          ],
        ),
      ),
    );
  }
}
