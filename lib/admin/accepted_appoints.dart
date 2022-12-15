import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AcceptedAppoints extends StatefulWidget {
  const AcceptedAppoints({super.key});

  @override
  State<AcceptedAppoints> createState() => _AcceptedAppointsState();
}

class _AcceptedAppointsState extends State<AcceptedAppoints> {
  @override
  Widget build(BuildContext context) {
    return const AcceptedAppointsProvider();
  }
}

class AcceptedAppointsProvider extends StatefulWidget {
  const AcceptedAppointsProvider({super.key});

  @override
  State<AcceptedAppointsProvider> createState() =>
      _AcceptedAppointsProviderState();
}

class _AcceptedAppointsProviderState extends State<AcceptedAppointsProvider> {
  String cdate = DateFormat("MM-dd-yyyy").format(DateTime.now());
  String tdata = DateFormat("hh:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            // .orderBy('appointment date', descending: false)
            .where('status', isEqualTo: 'approved')
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
            itemBuilder: (context, index) => AcceptedAppointContainer(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}

class AcceptedAppointContainer extends StatelessWidget {
  final snap;

  const AcceptedAppointContainer({
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
                          'Add Amount and Prescription here:',
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        content: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter Amount',
                                  hintText: '₹ 00.0',
                                  prefixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(
                                      Icons.payments_outlined,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Prescription',
                                  prefixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(
                                      Icons.note_add_outlined,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: MaterialButton(
                                      minWidth: 100,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      color: Colors.grey.shade700,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "No",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    color: Colors.green.shade400,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Submit",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                            color: Colors.white),
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
                icon: Icon(
                  Icons.edit_note_rounded,
                  color: Colors.blue.shade800,
                ),
                iconSize: 32,
              ),
            ),
            Column(
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
                            maxLines: 2,
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
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // "By : ${snap['appointed by']}",
                        'By Abishek',
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const VerticalDivider(
                        color: Colors.black87,
                        thickness: .5,
                      ),
                      Text(
                        // snap['appointed by'],
                        snap['appointed by'],
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const VerticalDivider(
                        color: Colors.black87,
                        thickness: .5,
                      ),
                      Text(
                        // snap['appointed by'],
                        '9443399014',
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 14,
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
          ],
        ),
      ),
    );
  }
}
