import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:lottie/lottie.dart';
import '../utils/submit_button.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
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
            "Gallery",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              //   height: 220,
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(110),
              //     // boxShadow: const [
              //     //   BoxShadow(
              //     //     color: Color(0x29000000),
              //     //     offset: Offset(0, 4),
              //     //     blurRadius: 3,
              //     //   ),
              //     // ],
              //   ),
              //   child: Lottie.asset('assets/lottie/calendar.json'),
              // ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 10, left: 10, bottom: 10),
                  child: StaggeredGrid.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 8,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: FullScreenWidget(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrP9mNRyOvjMG0JMo8iQQRM90tRZDP-PVdAIo6X4CJYyOF7Sikh6U-9I6uk5vhKAAeEJA&usqp=CAU',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: FullScreenWidget(
                            child: Center(
                                child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://images.squarespace-cdn.com/content/v1/5f168de061ba823d9aba54ed/1599202350464-EPTIXIX125W9WAZ7ZUG3/Dental+Implants',
                            fit: BoxFit.cover,
                          ),
                        ))),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 3,
                        mainAxisCellCount: 2,
                        child: FullScreenWidget(
                            child: Center(
                                child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://balusomansdental.com/wp-content/uploads/2019/11/dental-gal.jpg',
                            fit: BoxFit.cover,
                          ),
                        ))),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: FullScreenWidget(
                            child: Center(
                                child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://content.jdmagicbox.com/comp/shajapur/l9/9999p7364.7364.180604145318.n6l9/catalogue/patidar-dental-clinic-nalkheda-shajapur-dentists-5whn8zt8w3-250.jpg',
                            fit: BoxFit.cover,
                          ),
                        ))),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: FullScreenWidget(
                            child: Center(
                                child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'http://www.sanjeevanidentalclinic.com/wp-content/uploads/2019/10/sdc-orthodontics.jpg',
                            fit: BoxFit.cover,
                          ),
                        ))),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: FullScreenWidget(
                            child: Center(
                                child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://www.maruthidental.com/wp-content/uploads/2019/11/abt.jpg',
                            fit: BoxFit.cover,
                          ),
                        ))),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: FullScreenWidget(
                            child: Center(
                                child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://lh3.googleusercontent.com/p/AF1QipMGTYuhCQ1SKscKNtjtZ8gZqnPOgYb5mG8Sb-Gc=w1080-h608-p-no-v0',
                            fit: BoxFit.cover,
                          ),
                        ))),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: FullScreenWidget(
                            child: Center(
                                child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1629909615957-be38d48fbbe6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZGVudGFsJTIwY2xpbmljfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                            fit: BoxFit.cover,
                          ),
                        ))),
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
