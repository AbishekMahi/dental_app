import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RejectedAppoints extends StatefulWidget {
  const RejectedAppoints({super.key});

  @override
  State<RejectedAppoints> createState() => _RejectedAppointsState();
}

class _RejectedAppointsState extends State<RejectedAppoints> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 80,
          image: AssetImage("assets/images/sorry not available.png"),
          // fit: BoxFit.cover
        ),
      ),
    );
  }
}
