import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
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
            "Services",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        "Followings are our services:",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF006DE9),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: StaggeredGrid.count(
                        crossAxisCount: 6,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 8,
                        children: [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2.5,
                            child: FullScreenWidget(
                              backgroundColor: Colors.white,
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://abishekmahi.github.io/sais-dental-clinic/images/Bridges-Crowns.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "Bridges & Crowns",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "A crown or cap is a dental restoration that covers the exposed surface of a tooth to strengthen it or improve its appearance. A bridge is a dental restoration to replace one or more missing teeth. It includes an artificial tooth or teeth which are fused to crowns on either side to provide support.",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2.5,
                            child: FullScreenWidget(
                              backgroundColor: Colors.white,
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://abishekmahi.github.io/sais-dental-clinic/images/dentures.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "Dentures",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Dentures are removable appliances that can replace missing teeth and help restore your smile. \n\n Dentures are prosthetic devices constructed to replace missing teeth, and are supported by the surrounding soft and hard tissues of the oral cavity.",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2.5,
                            child: FullScreenWidget(
                              backgroundColor: Colors.white,
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://abishekmahi.github.io/sais-dental-clinic/images/dental-fillings.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "Dental Fillings",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "A crown or cap is a dental restoration that covers the exposed surface of a tooth to strengthen it or improve its appearance. A bridge is a dental restoration to replace one or more missing teeth. It includes an artificial tooth or teeth which are fused to crowns on either side to provide support.",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2.5,
                            child: FullScreenWidget(
                              backgroundColor: Colors.white,
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://abishekmahi.github.io/sais-dental-clinic/images/braces-aligners.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "Braces & Aligners",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "A crown or cap is a dental restoration that covers the exposed surface of a tooth to strengthen it or improve its appearance. A bridge is a dental restoration to replace one or more missing teeth. It includes an artificial tooth or teeth which are fused to crowns on either side to provide support.",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2.9,
                            child: FullScreenWidget(
                              backgroundColor: Colors.white,
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://abishekmahi.github.io/sais-dental-clinic/images/root-canal-treatment.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "Root Canal Treatment",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "A crown or cap is a dental restoration that covers the exposed surface of a tooth to strengthen it or improve its appearance. A bridge is a dental restoration to replace one or more missing teeth. It includes an artificial tooth or teeth which are fused to crowns on either side to provide support.",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2.9,
                            child: FullScreenWidget(
                              backgroundColor: Colors.white,
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://abishekmahi.github.io/sais-dental-clinic/images/wisdom-teeth-removal.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "Wisdom Teeth Removal",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth — the four permanent adult teeth located at the back corners of your mouth on the top and bottom.\n\n If a wisdom tooth doesn't have room to grow (impacted wisdom tooth), resulting in pain, infection or other dental problems, you'll likely need to have it pulled. Wisdom tooth extraction may be done by a dentist or an oral surgeon.\n\n To prevent potential future problems, some dentists and oral surgeons recommend wisdom tooth extraction even if impacted teeth aren't currently causing problems.",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2.5,
                            child: FullScreenWidget(
                              backgroundColor: Colors.white,
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://abishekmahi.github.io/sais-dental-clinic/images/dental-implants.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "Dental Implants",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Dental implants are replacement tooth roots. Implants provide a strong foundation for fixed (permanent) or removable replacement teeth that are made to match your natural teeth. \n\n Success rates of dental implants vary, depending on where in the jaw the implants are placed but, in general, dental implants have a success rate of up to 98%. With proper care (see below), implants can last a lifetime.",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
