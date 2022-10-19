import 'package:dental_app/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
  // Future<void> _refresh() async {
  //   Uri url = Uri.http(
  //       'https://script.googleusercontent.com/macros/echo?user_content_key=G_W4MT5IBf28y4ZgWpAjtu4PkWBZ6ece7H_klw1Be93vL812-8TRIXK3FfSIhozWcIiUf9E-RbkOSij7BVToLNE2TvaDr1Rmm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnF638I6s8bb5axVhEi-STtK38kziOzhZBUCzen7Da2zdxRRoLko5TkXKvUDbBWAUWOk4u_4YLlxTXoz-iUhm4Uhl_V-ObwYmENz9Jw9Md8uu&lib=MNYPwTRJwh6-a6yzrOoHLYY-v5gZnHGs0');
  //   http.Response res = await http.get(url);
  //   print(res.body);
  //   var response = cnv.jsonDecode(res.body);
  //   dataModel = DataModel.fromJson(response);
  //   setState(() {});
  // }

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
              "Testimonials",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            backgroundColor: const Color(0xFFEDE9FF),
            strokeWidth: 2,
            onRefresh: _refresh,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              padding: const EdgeInsets.all(15),
              child: Visibility(
                visible: isLoaded,
                replacement: SingleChildScrollView(
                  child: Column(
                    children: [
                      Lottie.asset(
                        'assets/lottie/skeleton-loading.json',
                      ),
                      Lottie.asset(
                        'assets/lottie/skeleton-loading.json',
                      ),
                    ],
                  ),
                ),
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
