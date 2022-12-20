import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:google_fonts/google_fonts.dart';

class Prescriptions extends StatefulWidget {
  const Prescriptions({super.key});

  @override
  State<Prescriptions> createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
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
            "Prescriptions",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: PrescriptionList(),
        ),
      ),
    );
  }
}

class PrescriptionList extends StatefulWidget {
  const PrescriptionList({super.key});

  @override
  State<PrescriptionList> createState() => _PrescriptionListState();
}

class _PrescriptionListState extends State<PrescriptionList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('appointments')
          // .orderBy('appointment date')
          .where("appointed by",
              isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .where("prescription added", isEqualTo: 'yes')
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) => PrescriptionContainer(
            snap: snapshot.data!.docs[index].data(),
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
        );
      },
    );
  }
}

class PrescriptionContainer extends StatelessWidget {
  final snap;
  const PrescriptionContainer({
    super.key,
    this.snap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FullScreenWidget(
                  child: Hero(
                    tag: snap['appoint id'],
                    child: SafeArea(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: ExtendedImage.network(
                          snap['prescription'],
                          width: double.infinity,
                          // height: 200,
                          fit: BoxFit.fitWidth,
                          cache: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                snap['appointment for'],
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Text(
                snap['appointment date'],
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
