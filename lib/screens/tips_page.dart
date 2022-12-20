import 'package:dental_app/screens/booking.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import '../utils/submit_button.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
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
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Tips",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 0,
              left: 15,
              right: 15,
            ),
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
                Center(
                  child: Text(
                    "10 Tips for Healthy Teeth & Gums:",
                    // textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Center(
                  child: Lottie.asset('assets/lottie/tooth.json', width: 200),
                ),
                Text(
                  "Brushing and flossing are staples in a good dental routine. However, there are other things you can do to help maintain healthy teeth and gums, which will benefit your overall wellbeing.\n",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "1. BRUSH YOUR TEETH TWICE A DAY FOR TWO MINUTES EACH TIME.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Lottie.asset('assets/lottie/brush-teeth.json',
                        width: 220),
                  ),
                ),
                Text(
                  "Keeping your teeth clean and healthy begins with regular maintenance. Brushing for two minutes at a time twice a day, known as the 2x2 rule, will help to keep plaque at bay.\n\n You can play a song while they're brushing, or use a timer to know when two full minutes have passed. To make it easier to clean every tooth, try to spend 30 seconds on each quadrant of your mouth (upper right side, upper left side, lower right side, lower left side). Using the right techniques are important to ensure the teeth are being cleaned properly and you aren't damaging the soft tissue around them.\n\n Using small circular motions, angle the head of the brush towards the gums. Be sure to clean all surfaces, as well as along the gum line, both on the fronts and backs of your teeth. Some patients find using an electric toothbrush helps as well.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "2. FLOSS DAILY.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FullScreenWidget(
                  backgroundColor: Colors.white,
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                            'https://mymagnoliadental.com/wp-content/uploads/sites/247/2020/07/shutterstock_341762891-min.jpg.optimal.jpg',
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "It's recommended to floss every night before brushing to remove anything your toothbrush is unable to dislodge. Many patients admit to skipping this step, but it is an important part of a healthy routine. If you only brush and decide you don't need to floss, small particles of food and other deposits that are missed by your toothbrush can eventually develop into decay.\n\n To avoid this, make sure you take two minutes a day to add flossing to your routine. When you first start flossing, it may cause sensitive gums to hurt. This is natural and will stop once you've been flossing for a couple days. When flossing, make sure you slide it up and down along the whole tooth. Don't ignore tight spaces, this is one of the most important places to floss as your toothbrush can't reach these areas.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "3. REPLACE YOUR TOOTH BRUSH AT THE SIGNS OF WEAR.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FullScreenWidget(
                  backgroundColor: Colors.white,
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                            'https://media.istockphoto.com/photos/new-and-worn-old-toothbrush-in-contrast-on-marble-background-picture-id1194110570?k=20&m=1194110570&s=612x612&w=0&h=RlPSqDnkHg0P7ryMAAYzmayDGFRGfJiU-8dCxtHZeiw=',
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "\nAs a general rule, changing it about every 3 to 6 months should keep it in shape to clean your teeth properly. Damaged or frayed toothbrushes can't clean the surface of your teeth correctly and can cause damage to your gums. Replacing your toothbrush often also allows you to help keep it clean. Always rinse your toothbrush well and store it so it can dry. Remember to replace your toothbrush if you've been sick to prevent bacteria from being re-introduced into your mouth.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "4. VISIT YOUR DENTIST EVERY SIX MONTHS.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FullScreenWidget(
                  backgroundColor: Colors.white,
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                            'https://media.istockphoto.com/vectors/dentist-office-tooth-care-and-treatment-theme-vector-id1091797100?k=20&m=1091797100&s=612x612&w=0&h=UFdJ_2oCVrN65M2LEkfi46N12V33Nd1d-jXRbiY87M8=',
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "\nYour dentist will be able to prevent issues before they start, or at least to catch them early, if you have regular dental appointments. Regular visits also allow your teeth to get a thorough professional cleaning twice a year, removing any buildup of plaque and tartar, which helps to keep your teeth and gums healthy.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "5. MAINTAIN A HEALTHY DIET.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FullScreenWidget(
                  backgroundColor: Colors.white,
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                            'https://mydentistburbank.com/wp-content/uploads/2021/06/teeth_damaging_foods.jpg',
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "\nAvoiding sweetened foods (such as pop, sports drinks, and candy) as well as including foods high in calcium will help to support strong and healthy teeth. As a side benefit, your body will thank you too! Some foods that will help to strengthen your teeth include leafy greens, almonds, yogurt, and cheese. Speak to your dentist for recommendations of foods that will help keep your teeth strong for years to come.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "6. USE DENTAL HYGIENE PRODUCTS.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FullScreenWidget(
                  backgroundColor: Colors.white,
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                            'https://d1kw0nx8pk9xzh.cloudfront.net/0001/ce5b05a7/resize-crop(w=1027;h=578):sharpen(level=0):output(format=jpeg)/up/dt/2021/10/The-good-the-bad-and-the-unproven.jpg',
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "\nBrushing and flossing are key to preventive dental health, but you can help keep your teeth in top condition by incorporating supplemental aids into your routine as well. Examples of these products include mouthwash, oral irrigators, interdental cleaners, and tongue cleaners. These aids can help support good oral health and should be used in conjunction with (not instead of) regular brushing and flossing.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "7. KEEP HYDRATED THROUGHOUT THE DAY.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FullScreenWidget(
                  backgroundColor: Colors.white,
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                            'https://www.intimina.com/blog/wp-content/uploads/2018/01/INTIMINA-blog-146-tips-stay-hydrated-drink-water.jpg',
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "\nSufficient hydration is not only good for your overall health, but being hydrated also helps maintain a healthy saliva flow. Saliva aids in dental health by moving food particles through your mouth, preventing most of them from lodging in your teeth where bacteria can grow. It also helps to keep your mouth comfortable and moist.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "8. DON'T SMOKE.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FullScreenWidget(
                  backgroundColor: Colors.white,
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                            'https://nollfamilydentistry.com/wp-content/uploads/2020/06/smoking-dental-health.jpg',
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "\nSmoking causes superficial concerns, such as tooth staining, as well as severe health issues like gum (periodontal) disease which can lead to tooth loss, and oral cancer, among other issues. One of the best things you could do for your oral and overall health is to quit smoking immediately.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "9. CONSIDER DENTAL SEALANTS.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FullScreenWidget(
                  backgroundColor: Colors.white,
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                            'https://www.esidentistry.com/wp-content/uploads/sites/61/2020/04/dental-fillings-sealants-dental-service-1024x768.jpg',
                            fit: BoxFit.cover,
                            cache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "\nDental sealant fills the depressions and grooves (fissures) of your molars and premolars, helping to protect your teeth from cavities and plaque. Most people can benefit from sealants, but children and teens are good candidates as they often don't brush as well as adults, leading to a higher rate of cavities.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "10. REGULARLY EXAMINE THE INSIDE OF YOUR MOUTH AT HOME.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF006DE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Lottie.asset('assets/lottie/teeth-care.json',
                        height: 280),
                  ),
                ),
                Text(
                  "\nWhile regular checkups with your dentist is an excellent preventive measure, issues can develop in the months between visits. To prevent major concerns, you should do a quick scan of the inside of your mouth as part of your daily routine. Check your teeth and gums for anything that has changed or seems unusual. Make sure you share this information with your dentist at your next appointment, or call your dentist's office if you discover anything concerning. Regular self-exams are beneficial to maintaining your health.",
                  style: GoogleFonts.poppins(
                      color: const Color(0xD5202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Submit_Button(
                  btntxt: 'Book Appointment',
                  fontSize: 20,
                  ontouch: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Booking(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// 10 Tips for Healthy Teeth & Gums
// Brushing and flossing are staples in a good dental routine. However, there are other things you can do to help maintain healthy teeth and gums, which will benefit your overall wellbeing.

// 1. BRUSH YOUR TEETH TWICE A DAY FOR TWO MINUTES EACH TIME.
// Keeping your teeth clean and healthy begins with regular maintenance. Brushing for two minutes at a time twice a day, known as the 2x2 rule, will help to keep plaque at bay. Patients with children should introduce this concept early, and find ways to make it fun. You can play a song while they're brushing, or use a timer to know when two full minutes have passed. To make it easier to clean every tooth, try to spend 30 seconds on each quadrant of your mouth (upper right side, upper left side, lower right side, lower left side). Using the right techniques are important to ensure the teeth are being cleaned properly and you aren't damaging the soft tissue around them. Using small circular motions, angle the head of the brush towards the gums. Be sure to clean all surfaces, as well as along the gum line, both on the fronts and backs of your teeth. Some patients find using an electric toothbrush helps as well.

// 2. FLOSS DAILY.
// It's recommended to floss every night before brushing to remove anything your toothbrush is unable to dislodge. Many patients admit to skipping this step, but it is an important part of a healthy routine. If you only brush and decide you don't need to floss, small particles of food and other deposits that are missed by your toothbrush can eventually develop into decay. To avoid this, make sure you take two minutes a day to add flossing to your routine. When you first start flossing, it may cause sensitive gums to hurt. This is natural and will stop once you've been flossing for a couple days. When flossing, make sure you slide it up and down along the whole tooth. Don't ignore tight spaces, this is one of the most important places to floss as your toothbrush can't reach these areas.

// 3. REPLACE YOUR TOOTHBRUSH AT THE SIGNS OF WEAR.
// As a general rule, changing it about every 3 to 6 months should keep it in shape to clean your teeth properly. Damaged or frayed toothbrushes can't clean the surface of your teeth correctly and can cause damage to your gums. Replacing your toothbrush often also allows you to help keep it clean. Always rinse your toothbrush well and store it so it can dry. Remember to replace your toothbrush if you've been sick to prevent bacteria from being re-introduced into your mouth.

// 4. VISIT YOUR DENTIST EVERY SIX MONTHS.
// Your dentist will be able to prevent issues before they start, or at least to catch them early, if you have regular dental appointments. Regular visits also allow your teeth to get a thorough professional cleaning twice a year, removing any buildup of plaque and tartar, which helps to keep your teeth and gums healthy.

// 5. MAINTAIN A HEALTHY DIET.
// Avoiding sweetened foods (such as pop, sports drinks, and candy) as well as including foods high in calcium will help to support strong and healthy teeth. As a side benefit, your body will thank you too! Some foods that will help to strengthen your teeth include leafy greens, almonds, yogurt, and cheese. Speak to your dentist for recommendations of foods that will help keep your teeth strong for years to come.

// 6. USE DENTAL HYGIENE PRODUCTS.
// Brushing and flossing are key to preventive dental health, but you can help keep your teeth in top condition by incorporating supplemental aids into your routine as well. Examples of these products include mouthwash, oral irrigators, interdental cleaners, and tongue cleaners. These aids can help support good oral health and should be used in conjunction with (not instead of) regular brushing and flossing.

// 7. KEEP HYDRATED THROUGHOUT THE DAY.
// Sufficient hydration is not only good for your overall health, but being hydrated also helps maintain a healthy saliva flow. Saliva aids in dental health by moving food particles through your mouth, preventing most of them from lodging in your teeth where bacteria can grow. It also helps to keep your mouth comfortable and moist.

// 8. DON'T SMOKE.
// Smoking causes superficial concerns, such as tooth staining, as well as severe health issues like gum (periodontal) disease which can lead to tooth loss, and oral cancer, among other issues. One of the best things you could do for your oral and overall health is to quit smoking immediately.

// 9. CONSIDER DENTAL SEALANTS.
// Dental sealant fills the depressions and grooves (fissures) of your molars and premolars, helping to protect your teeth from cavities and plaque. Most people can benefit from sealants, but children and teens are good candidates as they often don't brush as well as adults, leading to a higher rate of cavities.

// 10. REGULARLY EXAMINE THE INSIDE OF YOUR MOUTH AT HOME.
// While regular checkups with your dentist is an excellent preventive measure, issues can develop in the months between visits. To prevent major concerns, you should do a quick scan of the inside of your mouth as part of your daily routine. Check your teeth and gums for anything that has changed or seems unusual. Make sure you share this information with your dentist at your next appointment, or call your dentist's office if you discover anything concerning. Regular self-exams are beneficial to maintaining your health.
