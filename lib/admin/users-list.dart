import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserBios extends StatefulWidget {
  const UserBios({super.key});

  @override
  State<UserBios> createState() => _UserBiosState();
}

class _UserBiosState extends State<UserBios> {
  // set name(String name) {}
  String name = '';
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
          automaticallyImplyLeading: false,
          // centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    "Users",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Card(
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black87,
                    ),
                    hintText: 'Search users',
                    hintStyle: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
            margin: const EdgeInsets.all(10), child: const UsersList()),
      ),
    );
  }
}

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .orderBy('first name', descending: false)
          .snapshots(),
      // builder: (context, snapshot) {
      //   if (snapshot.hasError) {
      //     return const Text('Error');
      //   }
      //   if (snapshot.connectionState == ConnectionState.waiting) {
      //     return const Text('loading');
      //   }
      //   if (snapshot.hasData) {
      //     return ListView.builder(
      //       itemCount: snapshot.data!.docs.length,
      //       itemBuilder: (context, index) {
      //         return Text('${snapshot.data!.docs[index].data()['age']}');
      //       },
      //     );
      //   }
      //   return Text('loading');
      // },
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) => UserContainer(
            snap: snapshot.data!.docs[index].data(),
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        );
      },
    );
  }
}

class UserContainer extends StatelessWidget {
  final snap;
  const UserContainer({
    super.key,
    this.snap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Flexible(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 38,
                backgroundImage: const AssetImage(
                  "assets/images/default-profile-pic.jpg",
                ),
                foregroundImage: CachedNetworkImageProvider(snap['profileimg']),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  Text(
                    snap['first name'] + ' ' + snap['last name'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    snap['email'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    snap['age'] + ' years old',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15.0,
                    width: double.infinity,
                    child: Divider(
                      color: Colors.black45,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 18,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        snap['phone number'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            // color: Colors.black87,
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
