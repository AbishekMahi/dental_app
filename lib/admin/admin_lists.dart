import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminBio extends StatefulWidget {
  const AdminBio({super.key});

  @override
  State<AdminBio> createState() => _AdminBioState();
}

class _AdminBioState extends State<AdminBio> {
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
          automaticallyImplyLeading: false,
          // centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          // toolbarHeight: 100,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(
                textAlign: TextAlign.left,
                "Admins",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        body: Container(
            margin: const EdgeInsets.all(10), child: const AdminList()),
      ),
    );
  }
}

class AdminList extends StatefulWidget {
  const AdminList({super.key});

  @override
  State<AdminList> createState() => _AdminListState();
}

class _AdminListState extends State<AdminList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: "Admin")
          // .orderBy('first name', descending: false)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        return GridView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) => AdminContainer(
            snap: snapshot.data!.docs[index].data(),
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        );
      },
    );
  }
}

class AdminContainer extends StatelessWidget {
  final snap;
  const AdminContainer({
    super.key,
    this.snap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Hero(
        tag: snap['uid'],
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
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
                            'Remove Admin Access',
                            style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          content: SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Do you really want to change this account as User?',
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
                                      // onPressed: () {},
                                      onPressed: () {
                                        var collection = FirebaseFirestore
                                            .instance
                                            .collection('users');
                                        var docid = snap['uid'];
                                        collection.doc(docid).update({
                                          'role': 'User',
                                          'ex-admin': 'Yes'
                                        });
                                        // Show a snackbar with the result
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          backgroundColor:
                                              const Color(0xFF00C75A),
                                          content: Text(snap['first name'] +
                                              ' changed as User'),
                                        ));
                                        Navigator.pop(context);
                                        Navigator.of(context).pop();
                                      },
                                      color: Colors.red.shade400,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                                Icons
                                                    .remove_circle_outline_outlined,
                                                color: Colors.white),
                                            const SizedBox(width: 5),
                                            Text(
                                              "Yes",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
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
                  icon: const Icon(Icons.more_vert_rounded,
                      color: Colors.black87),
                  iconSize: 30,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 36,
                    backgroundImage: const AssetImage(
                      "assets/images/default-profile-pic.jpg",
                    ),
                    foregroundImage:
                        CachedNetworkImageProvider(snap['profileimg']),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        snap['first name'] + ' ' + snap['last name'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        snap['email'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      // const SizedBox(height: 5),
                      // Text(
                      //   snap['age'] + ' years old',
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.poppins(
                      //       color: Colors.black87,
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w400),
                      // ),
                    ],
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: snap['phone number'],
                      );
                      if (await canLaunch(launchUri.toString())) {
                        await launch(launchUri.toString());
                      } else {
                        print('not supported');
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          snap['phone number'],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              // color: Colors.black87,
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
