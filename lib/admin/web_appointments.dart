import 'package:dental_app/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../utils/web_appoints_model.dart';
import 'package:intl/intl.dart';

class WebAppoints extends StatefulWidget {
  const WebAppoints({super.key});

  @override
  State<WebAppoints> createState() => _WebAppointsState();
}

class _WebAppointsState extends State<WebAppoints> {
  List<WebAppointsModel>? webAppoints;
  var isLoaded = false;
  String datetime = DateFormat("dd MMM yyyy hh:mm a").format(DateTime.now());
  String appointTime = DateFormat("hh:mm a").format(DateTime.now());
  String cdate = DateFormat("MM-dd-yyyy").format(DateTime.now());
  @override
  void initState() {
    super.initState();
    // fetch data from API
    getData();
  }

  Future<void> _refresh() async {
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  getData() async {
    webAppoints = await WebAppointRemoteServices().getPosts();
    if (webAppoints != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Web Appointments",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            backgroundColor: const Color(0xFFEDE9FF),
            strokeWidth: 2,
            onRefresh: _refresh,
            child: Visibility(
              visible: isLoaded,
              replacement: SingleChildScrollView(
                child: Lottie.asset(
                  'assets/lottie/skeleton-loading.json',
                ),
              ),
              child: ListView.builder(
                itemCount: webAppoints?.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Appointed By :',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        webAppoints![index].name,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const VerticalDivider(
                                  color: Colors.black45,
                                  thickness: .5,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Appointed For :',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        webAppoints![index].appointType,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const Divider(
                          //   color: Colors.black45,
                          // ),
                          const SizedBox(
                            height: 5,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Appointment Date :',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            webAppoints![index]
                                                .appointDate
                                                .toLocal()
                                                .day
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '-',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            webAppoints![index]
                                                .appointDate
                                                .month
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '-',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            webAppoints![index]
                                                .appointDate
                                                .year
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const VerticalDivider(
                                  color: Colors.black45,
                                  thickness: .5,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Appointment Time :',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            webAppoints![index].appointTime,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.black45,
                          ),
                          Text(
                            'Message :',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            webAppoints![index].message,
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          MaterialButton(
                            color: Colors.blue,
                            onPressed: () async {
                              final Uri launchUri = Uri(
                                scheme: 'tel',
                                path: webAppoints![index].phone.toString(),
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
                                  webAppoints![index].phone.toString(),
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
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
