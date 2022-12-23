import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
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
            "Payments",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: const PaymentProvider(),
      ),
    );
  }
}

class PaymentProvider extends StatefulWidget {
  const PaymentProvider({super.key});

  @override
  State<PaymentProvider> createState() => _PaymentProviderState();
}

class _PaymentProviderState extends State<PaymentProvider> {
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
            // .where('status', isEqualTo: 'approved')
            .where('amount paid', isGreaterThan: '1')
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
            itemBuilder: (context, index) => PaymentContainer(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}

class PaymentContainer extends StatelessWidget {
  final snap;
  const PaymentContainer({super.key, this.snap});

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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                "assets/images/rupee.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Recieved',
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      // const VerticalDivider(
                      //   color: Colors.black87,
                      //   thickness: .5,
                      // ),
                      Text(
                        snap['appointed by'],
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      // const VerticalDivider(
                      //   color: Colors.black87,
                      //   thickness: .5,
                      // ),
                      // Text(
                      //   // snap['appointed by'],
                      //   '📞 9443399014',
                      //   style: GoogleFonts.poppins(
                      //       color: Colors.black87,
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w400),
                      // ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black45,
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  color: Colors.green.shade600,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle_outline_outlined,
                            color: Colors.white),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Amount : ₹ ${snap['amount paid']}",
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
  }
}
