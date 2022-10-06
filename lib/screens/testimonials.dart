import 'package:dental_app/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/feedback_model.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({super.key});

  @override
  State<Testimonials> createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  List<FeedbackModel>? feedbacks;
  var isLoaded = false;

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
    feedbacks = await RemoteServices().getPosts();
    if (feedbacks != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Testimonials",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            backgroundColor: const Color(0xFFEDE9FF),
            strokeWidth: 2,
            // color: const Color(0XFF7455F7),
            onRefresh: _refresh,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              child: Visibility(
                visible: isLoaded,
                replacement: const Center(child: CircularProgressIndicator()),
                child: ListView.builder(
                  itemCount: feedbacks?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(
                                feedbacks![index].profilePic,
                              ),
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  feedbacks![index].name,
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  feedbacks![index].feedback,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String? profilePic, name, feedback;
  const FeedbackTile(
      {super.key,
      required this.profilePic,
      required this.name,
      required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      child: Image.network(profilePic!))),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name!),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(feedback!)
        ],
      ),
    );
  }
}
