import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    List<ServiceBox> myServices = [
      const ServiceBox(
          name: "Bridges & Crowns",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/Bridges-Crowns.jpg",
          desc: ''),
      const ServiceBox(
          name: "Dental Fillings",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/dental-fillings.jpg",
          desc: ''),
      const ServiceBox(
          name: "Dentures",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/dentures.jpg",
          desc: ''),
      const ServiceBox(
          name: "Braces & Aligners",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/braces-aligners.jpg",
          desc: ''),
      const ServiceBox(
          name: "Root Canal Treatment",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/root-canal-treatment.jpg",
          desc: ''),
      const ServiceBox(
          name: "Wisdom Teeth Removal",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/wisdom-teeth-removal.jpg",
          desc: ''),
      const ServiceBox(
          name: "Dental Implants",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/dental-implants.jpg",
          desc: ''),
      const ServiceBox(
          name: "Teeth Whitening",
          image: "https://i.postimg.cc/SRMxmjMz/Teeth-Whitening.jpg",
          desc: ''),
    ];
    // final List<Map> myProducts =
    //     List.generate(10, (index) => {"id": index, "name": "Product $index"})
    //         .toList();
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
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Services",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Text(
                "Followings are our services",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: myServices.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return ServiceBox(
                      name: myServices[index].name,
                      image: myServices[index].image,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        //   SingleChildScrollView(
        //     scrollDirection: Axis.vertical,
        //     child: Column(
        //       children: [
        //         Text(
        //           "Followings are our services",
        //           style: GoogleFonts.poppins(
        //               color: Colors.white,
        //               fontSize: 20,
        //               fontWeight: FontWeight.w500),
        //         ),
        //         // GridView.builder(
        //         //   itemCount: snapshot.data!.docs.length,
        //         //   itemBuilder: (context, index) => UserContainer(
        //         //     snap: snapshot.data!.docs[index].data(),
        //         //   ),
        //         //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //         //     maxCrossAxisExtent: 220,
        //         //     childAspectRatio: 3 / 4,
        //         //     crossAxisSpacing: 10,
        //         //     mainAxisSpacing: 10,
        //         //   ),
        //         // ),

        //         Container(
        //           decoration: const BoxDecoration(
        //             color: Colors.white,
        //           ),
        //           child: Text(
        //             "Bridges & Crowns",
        //             style: GoogleFonts.poppins(
        //                 color: Colors.black87,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.w500),
        //           ),
        //         ),
        //         Container(
        //           margin: const EdgeInsets.all(10),
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(12),
        //             boxShadow: const [
        //               BoxShadow(
        //                 color: Color(0x29000000),
        //                 offset: Offset(0, 4),
        //                 blurRadius: 3,
        //               ),
        //             ],
        //           ),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.all(8),
        //                 child: StaggeredGrid.count(
        //                   crossAxisCount: 6,
        //                   mainAxisSpacing: 0,
        //                   crossAxisSpacing: 8,
        //                   children: [
        //                     StaggeredGridTile.count(
        //                       crossAxisCellCount: 3,
        //                       mainAxisCellCount: 2.5,
        //                       child: FullScreenWidget(
        //                         backgroundColor: Colors.white,
        //                         child: SafeArea(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        // ClipRRect(
        //   borderRadius:
        //       BorderRadius.circular(8.0),
        //   child: ExtendedImage.network(
        //     'https://abishekmahi.github.io/sais-dental-clinic/images/Bridges-Crowns.jpg',
        //     fit: BoxFit.cover,
        //     cache: true,
        //   ),
        // ),
        //                                 Text(
        //                                   "Bridges & Crowns",
        //                                   style: GoogleFonts.poppins(
        //                                       color: Colors.black87,
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w500),
        //                                 ),
        //                                 Expanded(
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Text(
        //                                       "A crown or cap is a dental restoration that covers the exposed surface of a tooth to strengthen it or improve its appearance. A bridge is a dental restoration to replace one or more missing teeth. It includes an artificial tooth or teeth which are fused to crowns on either side to provide support.",
        //                                       style: GoogleFonts.poppins(
        //                                           color: Colors.black87,
        //                                           fontSize: 16,
        //                                           fontWeight: FontWeight.w400),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     StaggeredGridTile.count(
        //                       crossAxisCellCount: 3,
        //                       mainAxisCellCount: 2.5,
        //                       child: FullScreenWidget(
        //                         backgroundColor: Colors.white,
        //                         child: SafeArea(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        //                                 ClipRRect(
        //                                   borderRadius:
        //                                       BorderRadius.circular(8.0),
        //                                   child: ExtendedImage.network(
        //                                     'https://abishekmahi.github.io/sais-dental-clinic/images/dentures.jpg',
        //                                     fit: BoxFit.cover,
        //                                     cache: true,
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   "Dentures",
        //                                   style: GoogleFonts.poppins(
        //                                       color: Colors.black87,
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w500),
        //                                 ),
        //                                 Expanded(
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Text(
        //                                       "Dentures are removable appliances that can replace missing teeth and help restore your smile. \n\n Dentures are prosthetic devices constructed to replace missing teeth, and are supported by the surrounding soft and hard tissues of the oral cavity.",
        //                                       style: GoogleFonts.poppins(
        //                                           color: Colors.black87,
        //                                           fontSize: 16,
        //                                           fontWeight: FontWeight.w400),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     StaggeredGridTile.count(
        //                       crossAxisCellCount: 3,
        //                       mainAxisCellCount: 2.5,
        //                       child: FullScreenWidget(
        //                         backgroundColor: Colors.white,
        //                         child: SafeArea(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        //                                 ClipRRect(
        //                                   borderRadius:
        //                                       BorderRadius.circular(8.0),
        //                                   child: ExtendedImage.network(
        //                                     'https://abishekmahi.github.io/sais-dental-clinic/images/dental-fillings.jpg',
        //                                     fit: BoxFit.cover,
        //                                     cache: true,
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   "Dental Fillings",
        //                                   style: GoogleFonts.poppins(
        //                                       color: Colors.black87,
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w500),
        //                                 ),
        //                                 Expanded(
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Text(
        //                                       "A crown or cap is a dental restoration that covers the exposed surface of a tooth to strengthen it or improve its appearance. A bridge is a dental restoration to replace one or more missing teeth. It includes an artificial tooth or teeth which are fused to crowns on either side to provide support.",
        //                                       style: GoogleFonts.poppins(
        //                                           color: Colors.black87,
        //                                           fontSize: 16,
        //                                           fontWeight: FontWeight.w400),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     StaggeredGridTile.count(
        //                       crossAxisCellCount: 3,
        //                       mainAxisCellCount: 2.5,
        //                       child: FullScreenWidget(
        //                         backgroundColor: Colors.white,
        //                         child: SafeArea(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        //                                 ClipRRect(
        //                                   borderRadius:
        //                                       BorderRadius.circular(8.0),
        //                                   child: ExtendedImage.network(
        //                                     'https://abishekmahi.github.io/sais-dental-clinic/images/braces-aligners.jpg',
        //                                     fit: BoxFit.cover,
        //                                     cache: true,
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   "Braces & Aligners",
        //                                   style: GoogleFonts.poppins(
        //                                       color: Colors.black87,
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w500),
        //                                 ),
        //                                 Expanded(
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Text(
        //                                       "A crown or cap is a dental restoration that covers the exposed surface of a tooth to strengthen it or improve its appearance. A bridge is a dental restoration to replace one or more missing teeth. It includes an artificial tooth or teeth which are fused to crowns on either side to provide support.",
        //                                       style: GoogleFonts.poppins(
        //                                           color: Colors.black87,
        //                                           fontSize: 16,
        //                                           fontWeight: FontWeight.w400),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     StaggeredGridTile.count(
        //                       crossAxisCellCount: 3,
        //                       mainAxisCellCount: 2.9,
        //                       child: FullScreenWidget(
        //                         backgroundColor: Colors.white,
        //                         child: SafeArea(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        //                                 ClipRRect(
        //                                   borderRadius:
        //                                       BorderRadius.circular(8.0),
        //                                   child: ExtendedImage.network(
        //                                     'https://abishekmahi.github.io/sais-dental-clinic/images/root-canal-treatment.jpg',
        //                                     fit: BoxFit.cover,
        //                                     cache: true,
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   "Root Canal Treatment",
        //                                   style: GoogleFonts.poppins(
        //                                       color: Colors.black87,
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w500),
        //                                 ),
        //                                 Expanded(
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Text(
        //                                       "A crown or cap is a dental restoration that covers the exposed surface of a tooth to strengthen it or improve its appearance. A bridge is a dental restoration to replace one or more missing teeth. It includes an artificial tooth or teeth which are fused to crowns on either side to provide support.",
        //                                       style: GoogleFonts.poppins(
        //                                           color: Colors.black87,
        //                                           fontSize: 14,
        //                                           fontWeight: FontWeight.w400),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     StaggeredGridTile.count(
        //                       crossAxisCellCount: 3,
        //                       mainAxisCellCount: 2.9,
        //                       child: FullScreenWidget(
        //                         backgroundColor: Colors.white,
        //                         child: SafeArea(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        //                                 ClipRRect(
        //                                   borderRadius:
        //                                       BorderRadius.circular(8.0),
        //                                   child: ExtendedImage.network(
        //                                     'https://abishekmahi.github.io/sais-dental-clinic/images/wisdom-teeth-removal.jpg',
        //                                     fit: BoxFit.cover,
        //                                     cache: true,
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   "Wisdom Teeth Removal",
        //                                   style: GoogleFonts.poppins(
        //                                       color: Colors.black87,
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w500),
        //                                 ),
        //                                 Expanded(
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Text(
        //                                       "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth — the four permanent adult teeth located at the back corners of your mouth on the top and bottom.\n\n If a wisdom tooth doesn't have room to grow (impacted wisdom tooth), resulting in pain, infection or other dental problems, you'll likely need to have it pulled. Wisdom tooth extraction may be done by a dentist or an oral surgeon.\n\n To prevent potential future problems, some dentists and oral surgeons recommend wisdom tooth extraction even if impacted teeth aren't currently causing problems.",
        //                                       style: GoogleFonts.poppins(
        //                                           color: Colors.black87,
        //                                           fontSize: 14,
        //                                           fontWeight: FontWeight.w400),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     StaggeredGridTile.count(
        //                       crossAxisCellCount: 3,
        //                       mainAxisCellCount: 2.5,
        //                       child: FullScreenWidget(
        //                         backgroundColor: Colors.white,
        //                         child: SafeArea(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        //                                 ClipRRect(
        //                                   borderRadius:
        //                                       BorderRadius.circular(8.0),
        //                                   child: ExtendedImage.network(
        //                                     'https://abishekmahi.github.io/sais-dental-clinic/images/dental-implants.jpg',
        //                                     fit: BoxFit.cover,
        //                                     cache: true,
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   "Dental Implants",
        //                                   style: GoogleFonts.poppins(
        //                                       color: Colors.black87,
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w500),
        //                                 ),
        //                                 Expanded(
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Text(
        //                                       "Dental implants are replacement tooth roots. Implants provide a strong foundation for fixed (permanent) or removable replacement teeth that are made to match your natural teeth. \n\n Success rates of dental implants vary, depending on where in the jaw the implants are placed but, in general, dental implants have a success rate of up to 98%. With proper care (see below), implants can last a lifetime.",
        //                                       style: GoogleFonts.poppins(
        //                                           color: Colors.black87,
        //                                           fontSize: 16,
        //                                           fontWeight: FontWeight.w400),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     StaggeredGridTile.count(
        //                       crossAxisCellCount: 3,
        //                       mainAxisCellCount: 2.5,
        //                       child: FullScreenWidget(
        //                         backgroundColor: Colors.white,
        //                         child: SafeArea(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Column(
        //                               children: [
        //                                 ClipRRect(
        //                                   borderRadius:
        //                                       BorderRadius.circular(8.0),
        //                                   child: ExtendedImage.network(
        //                                     'https://i.postimg.cc/SRMxmjMz/Teeth-Whitening.jpg',
        //                                     fit: BoxFit.cover,
        //                                     cache: true,
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   "Teeth Whitening",
        //                                   style: GoogleFonts.poppins(
        //                                       color: Colors.black87,
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w500),
        //                                 ),
        //                                 Expanded(
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Text(
        //                                       "Yellow, dull looking teeth bothering you? Then your solution might be in teeth whitening/teeth bleaching.Let your pearly whites shine and reflect your beauty. ",
        //                                       style: GoogleFonts.poppins(
        //                                           color: Colors.black87,
        //                                           fontSize: 16,
        //                                           fontWeight: FontWeight.w400),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
      ),
    );
  }
}

class ServiceBox extends StatelessWidget {
  final String name;
  final String image;
  final String? desc;
  final snap;

  const ServiceBox({
    super.key,
    required this.name,
    required this.image,
    this.desc,
    this.snap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => FullServices(snap: snap),
          ),
        );
      },
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(2, 8),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ExtendedImage.network(
                image,
                fit: BoxFit.fitWidth,
                cache: true,
              ),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}

class FullServices extends StatefulWidget {
  const FullServices({super.key, required this.snap});
  final snap;
  @override
  State<FullServices> createState() => _FullServicesState();
}

class _FullServicesState extends State<FullServices> {
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
          // automaticallyImplyLeading: false,
          // centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            textAlign: TextAlign.left,
            "Full Profile",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          child: Text('widget.snap.name'),
        ),
      ),
    );
  }
}
