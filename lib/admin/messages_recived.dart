import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
            "Messages",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('messages').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => MsgContainer(
                snap: snapshot.data!.docs[index].data(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MsgContainer extends StatelessWidget {
  final snap;
  const MsgContainer({
    super.key,
    this.snap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: snap['user img'],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snap['subject'],
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "~ ${snap['user fname']}" " " '${snap['user lname']}',
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
                width: 1,
                child: Divider(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            snap['message'],
            textAlign: TextAlign.left,
            // maxLines: 3,
            style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
          // const Divider(
          //   color: Colors.black45,
          // ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                snap['messaged time'],
                style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
