import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FullProfile extends StatefulWidget {
  const FullProfile({super.key, required this.snap});
  final Map<String, dynamic> snap;

  @override
  State<FullProfile> createState() => _FullProfileState();
}

class _FullProfileState extends State<FullProfile> {
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
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  textAlign: TextAlign.left,
                  "Full Profile",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Hero(
                tag: widget.snap['uid'],
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: 165,
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/images/back.png"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Make Admin',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  content: SizedBox(
                                    height: 150,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Do you really want to make this user as admin?',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: MaterialButton(
                                                minWidth: 100,
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                color: Colors.grey.shade700,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "No",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            MaterialButton(
                                              // onPressed: () {},
                                              onPressed: () {
                                                var collection =
                                                    FirebaseFirestore.instance
                                                        .collection('users');
                                                var docid = widget.snap['uid'];
                                                collection
                                                    .doc(docid)
                                                    .update({'role': 'Admin'});
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                              },
                                              color: Colors.green.shade400,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Yes",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                          icon: const Icon(Icons.more_vert_rounded,
                              color: Colors.black87),
                          iconSize: 30,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              child: CachedNetworkImage(
                                imageUrl: widget.snap['profileimg'],
                                height: double.infinity,
                                // width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person_outline_rounded,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        widget.snap['first name'] +
                                            " " +
                                            widget.snap['last name'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        EvaIcons.emailOutline,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 4),
                                      Flexible(
                                        child: Text(
                                          widget.snap['email'],
                                          style: GoogleFonts.poppins(
                                              color: Colors.black87,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.cake_outlined,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        widget.snap['dob'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        widget.snap['gender'] == 'Male'
                                            ? Icons.male_outlined
                                            : Icons.female_outlined,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        widget.snap['gender'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        EvaIcons.phoneOutline,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        widget.snap['phone number'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // the tab bar with two items
              SizedBox(
                height: 50,
                child: AppBar(
                  // elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    tabs: [
                      Tab(
                        child: Text(
                          'Pending',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Prescription',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Appointments',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Files',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TabBarView(
                    children: [
                      // first tab bar view widget
                      UserAppoints(
                        snap: widget.snap['email'],
                      ),

                      // second tab bar viiew widget
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: PrescriptionList(
                          snap: widget.snap['email'],
                        ),
                      ),

                      // Third tab bar viiew widget
                      AcceptedUserAppoints(
                        snap: widget.snap['email'],
                      ),

                      // fourth tab bar viiew widget
                      Center(
                        child: Text(
                          'Empty',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserAppoints extends StatefulWidget {
  const UserAppoints({super.key, this.snap});
  final snap;
  @override
  State<UserAppoints> createState() => _UserAppointsState();
}

class _UserAppointsState extends State<UserAppoints> {
  String cdate = DateFormat("MM-dd-yyyy").format(DateTime.now());
  String tdata = DateFormat("hh:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .where('status', isEqualTo: 'pending')
            .where('appointed by', isEqualTo: widget.snap)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => Column(
              children: [
                // print(widget.snap['uid']),
                UserAppointContainer(
                  usersnap: snapshot.data!.docs[index].data(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class UserAppointContainer extends StatelessWidget {
  final usersnap;
  const UserAppointContainer({
    super.key,
    required Map<String, dynamic> this.usersnap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                                "assets/images/${usersnap['status']}.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              usersnap['status'],
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
                                usersnap['appointment for'],
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
                                    usersnap['appointment date'],
                                    style: GoogleFonts.poppins(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
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
                                    usersnap['appointment time'],
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
                        'By Abishek',
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        usersnap['appointed by'],
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
                      "Amount : ₹ ${usersnap['amount paid']}",
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
                      usersnap['appointed time'],
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
                        var docid = usersnap['appoint id'];
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
                        var docid = usersnap['appoint id'];
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

class PrescriptionList extends StatefulWidget {
  const PrescriptionList({super.key, this.snap});
  final snap;

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
          .where("appointed by", isEqualTo: widget.snap)
          .where("prescription added", isEqualTo: 'yes')
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
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

class AcceptedUserAppoints extends StatefulWidget {
  const AcceptedUserAppoints({super.key, this.snap});
  final snap;

  @override
  State<AcceptedUserAppoints> createState() => _AcceptedUserAppointsState();
}

class _AcceptedUserAppointsState extends State<AcceptedUserAppoints> {
  String cdate = DateFormat("MM-dd-yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     opacity: 80,
      //     image: AssetImage("assets/images/old.png"),
      //   ),
      // ),
      padding: const EdgeInsets.only(bottom: 10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .where("appointed by", isEqualTo: widget.snap)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
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
                            width: 40,
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
