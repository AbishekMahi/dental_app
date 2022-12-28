import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import '../utils/img_picker.dart';

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

class AcceptedAppointContainer extends StatefulWidget {
  final snap;
  const AcceptedAppointContainer(
      {super.key, required Map<String, dynamic> this.snap});

  @override
  State<AcceptedAppointContainer> createState() =>
      _AcceptedAppointContainerState(this.snap);
}

class _AcceptedAppointContainerState extends State<AcceptedAppointContainer> {
  final snap;
  // final amount = TextEditingController();

  _AcceptedAppointContainerState(this.snap);

  // final amount = TextEditingController(text: "1000");
  final amount = TextEditingController();
  // final controller = TextEditingController();
  Uint8List? imageUrl;

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  void selectImg() async {
    Uint8List img = await pickImg(ImageSource.gallery);
    setState(() {
      imageUrl = img;
    });
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> uploadPresToStorage(String childname, Uint8List file) async {
    Reference ref = _storage
        .ref()
        .child(childname)
        .child(_auth.currentUser!.uid + snap['appoint id']);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

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
              child: PopupMenuButton(
                color: Colors.blue.shade50,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () async {
                      Future.delayed(const Duration(seconds: 0), () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Add Amount',
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              content: SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextFormField(
                                      controller: amount,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        hintText: "₹ " + snap!['amount paid'],
                                        prefixIcon: const Align(
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
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
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () async {
                                            var collection = FirebaseFirestore
                                                .instance
                                                .collection('appointments');
                                            var docid = snap['appoint id'];
                                            collection.doc(docid).update({
                                              'amount paid': amount.text,
                                              'amount edited by': {
                                                'email': FirebaseAuth.instance
                                                    .currentUser!.email,
                                                'uid': FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                'last edited': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            });
                                            Navigator.of(context).pop();
                                          },
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
                      });
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.currency_rupee_rounded,
                          size: 22,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Add Amount',
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () async {
                      Future.delayed(const Duration(seconds: 0), () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Add Prescription',
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              content: SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: (() {
                                        selectImg();
                                      }),
                                      child: Ink(
                                        color: Colors.blue,
                                        padding: const EdgeInsets.all(13),
                                        child: Row(
                                          children: [
                                            const Icon(
                                                Icons.add_a_photo_outlined,
                                                color: Colors.white),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Add Prescription',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
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
                                          padding:
                                              const EdgeInsets.only(right: 8),
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
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () async {
                                            String photoUrl =
                                                await uploadPresToStorage(
                                                    'prescription', imageUrl!);
                                            var collection = FirebaseFirestore
                                                .instance
                                                .collection('appointments');
                                            var docid = snap['appoint id'];
                                            collection.doc(docid).update({
                                              'prescription': photoUrl,
                                              'prescription added': 'yes',
                                              'prescription edited by': {
                                                'email': FirebaseAuth.instance
                                                    .currentUser!.email,
                                                'uid': FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                'last edited': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            });
                                            Navigator.of(context).pop();
                                          },
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
                      });
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit_note_rounded,
                          size: 22,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Add Prescription',
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
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
                      const VerticalDivider(
                        color: Colors.black87,
                        thickness: .5,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
            // Positioned(
            //   top: -10,
            //   right: -10,
            //   child: IconButton(
            //     onPressed: () async {
            //       showDialog(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(
            //             title: Text(
            //               'Add Amount and Prescription here:',
            //               style: GoogleFonts.poppins(
            //                   color: Colors.black87,
            //                   fontSize: 18,
            //                   fontWeight: FontWeight.w500),
            //             ),
            //             content: SizedBox(
            //               height: 200,
            //               width: double.infinity,
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                 children: [
            //                   // Text(amount.text),
            //                   TextFormField(
            //                     controller: amount,
            //                     // initialValue: snap!['amount paid'],
            //                     keyboardType: TextInputType.number,
            //                     decoration: InputDecoration(
            //                       border: const OutlineInputBorder(),
            //                       // labelText: 'Enter Amount',
            //                       hintText: "₹ " + snap!['amount paid'],
            //                       prefixIcon: const Align(
            //                         widthFactor: 1.0,
            //                         heightFactor: 1.0,
            //                         child: Icon(
            //                           Icons.payments_outlined,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   const SizedBox(
            //                     height: 5,
            //                   ),
            //                   InkWell(
            //                     onTap: (() {
            //                       selectImg();
            //                     }),
            //                     child: Ink(
            //                       color: Colors.blue,
            //                       padding: const EdgeInsets.all(13),
            //                       child: Row(
            //                         children: [
            //                           const Icon(Icons.add_a_photo_outlined,
            //                               color: Colors.white),
            //                           const SizedBox(
            //                             width: 5,
            //                           ),
            //                           Expanded(
            //                               child: Text(
            //                             'Add Prescription',
            //                             style: GoogleFonts.poppins(
            //                                 fontSize: 18,
            //                                 fontWeight: FontWeight.w500,
            //                                 height: 0,
            //                                 color: Colors.white),
            //                           )),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                   const SizedBox(
            //                     height: 5,
            //                   ),
            //                   Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceEvenly,
            //                     children: [
            //                       Padding(
            //                         padding: const EdgeInsets.only(right: 8),
            //                         child: MaterialButton(
            //                           minWidth: 100,
            //                           onPressed: () {
            //                             Navigator.of(context).pop();
            //                           },
            //                           color: Colors.grey.shade700,
            //                           child: Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: Text(
            //                               "No",
            //                               style: GoogleFonts.poppins(
            //                                   fontSize: 18,
            //                                   fontWeight: FontWeight.w500,
            //                                   height: 0,
            //                                   color: Colors.white),
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       MaterialButton(
            //                         onPressed: () async {
            //                           String photoUrl =
            //                               await uploadPresToStorage(
            //                                   'prescription', imageUrl!);
            //                           var collection = FirebaseFirestore
            //                               .instance
            //                               .collection('appointments');
            //                           var docid = snap['appoint id'];
            //                           collection.doc(docid).update({
            //                             'amount paid': amount.text,
            //                             'prescription added': 'yes',
            //                             'last edited':
            //                                 FieldValue.serverTimestamp(),
            //                             'edited by': {
            //                               'email': FirebaseAuth
            //                                   .instance.currentUser!.email,
            //                               'uid': FirebaseAuth
            //                                   .instance.currentUser!.uid,
            //                             },
            //                             'prescription': photoUrl
            //                           });
            //                           Navigator.of(context).pop();
            //                         },
            //                         color: Colors.green.shade400,
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(8.0),
            //                           child: Text(
            //                             "Submit",
            //                             style: GoogleFonts.poppins(
            //                                 fontSize: 18,
            //                                 fontWeight: FontWeight.w500,
            //                                 height: 0,
            //                                 color: Colors.white),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         },
            //       );
            //     },
            //     splashRadius: 26,
            //     icon: Icon(
            //       Icons.edit_note_rounded,
            //       color: Colors.blue.shade800,
            //     ),
            //     iconSize: 32,
            //   ),
            // ),