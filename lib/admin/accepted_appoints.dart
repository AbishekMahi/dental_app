import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptedAppoints extends StatefulWidget {
  const AcceptedAppoints({super.key});

  @override
  State<AcceptedAppoints> createState() => _AcceptedAppointsState();
}

class _AcceptedAppointsState extends State<AcceptedAppoints> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 80,
          image: AssetImage("assets/images/approved.png"),
          // fit: BoxFit.cover
        ),
      ),
    );
  }
}
