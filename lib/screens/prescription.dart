import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              //   height: 200,
              //   width: 200,
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(100),
              //     boxShadow: const [
              //       BoxShadow(
              //         color: Color(0x29000000),
              //         offset: Offset(0, 4),
              //         blurRadius: 3,
              //       ),
              //     ],
              //   ),
              //   child: Lottie.asset('assets/lottie/medicine.json'),
              // ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10, bottom: 15),
                    //   child: Text(
                    //     'Get Your Prescriptions:',
                    //     textAlign: TextAlign.left,
                    //     style: GoogleFonts.poppins(
                    //         fontSize: 22,
                    //         fontWeight: FontWeight.w500,
                    //         height: 0,
                    //         color: Colors.white),
                    //   ),
                    // ),
                    StaggeredGrid.count(
                      crossAxisCount: 6,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 3.3,
                          child: InkWell(
                            child: Ink(
                              padding: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(2, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/pin.png',
                                    width: 125,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '2nd January 2019\n  12:34 PM',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 3.3,
                          child: InkWell(
                            child: Ink(
                              padding: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(2, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/pin.png',
                                    width: 125,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '2nd January 2019\n  12:34 PM',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 3.3,
                          child: InkWell(
                            child: Ink(
                              padding: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(2, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/pin.png',
                                    width: 125,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '2nd January 2019\n  12:34 PM',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 3.3,
                          child: InkWell(
                            child: Ink(
                              padding: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(2, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/pin.png',
                                    width: 125,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '2nd January 2019\n  12:34 PM',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 3.3,
                          child: InkWell(
                            child: Ink(
                              padding: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(2, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/pin.png',
                                    width: 125,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '2nd January 2019\n  12:34 PM',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 3,
                          mainAxisCellCount: 3.3,
                          child: InkWell(
                            child: Ink(
                              padding: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(2, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/pin.png',
                                    width: 125,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '2nd January 2019\n  12:34 PM',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
