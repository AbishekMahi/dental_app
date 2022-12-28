import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    List<ServiceBox> myServices = [
      ServiceBox(
          name: "Bridges & Crowns",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/Bridges-Crowns.jpg",
          desc:
              'Both crowns and most bridges are fixed prosthetic devices. Unlike removable devices such as dentures, which you can take out and clean daily, crowns and bridges are cemented onto existing teeth or implants, and can only be removed by a dentist. \n\nA crown is used to entirely cover or "cap" a damaged tooth. Besides strengthening a damaged tooth, a crown can be used to improve its appearance, shape or alignment. A crown can also be placed on top of an implant to provide a tooth-like shape and structure for function. Porcelain or ceramic crowns can be matched to the color of your natural teeth. Other materials include gold and metal alloys, acrylic and ceramic. These alloys are generally stronger than porcelain and may be recommended for back teeth. Porcelain bonded to a metal shell is often used because it is both strong and attractive.'),
      ServiceBox(
          name: "Dental Fillings",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/dental-fillings.jpg",
          desc:
              'Dental filling is used to treat a small hole, or cavity, in a tooth. To repair a cavity, a dentist removes the decayed tooth tissue and then fills the space with a filling material. \n\nTooth decay is damage to a tooth that can happen when harmful bacteria in your mouth make acids that attack the tooth enamel. This can lead to a small hole in a tooth, called a cavity. More severe decay can cause a large hole or even destruction of the entire tooth. If tooth decay is not treated, it can cause pain, infection, and even tooth loss. \n\nWhen a tooth is exposed to acid frequently—for example, if you eat or drink often, especially foods or drinks containing sugar and starches—the repeated cycles of acid attacks cause the enamel to continue to lose minerals. A white spot may appear where minerals have been lost. This is a sign of early decay. \n\nTooth decay can be stopped or reversed at this point. Enamel can repair itself by using minerals from saliva and fluoride from toothpaste or other sources. But if the tooth decay process continues, more minerals are lost. Over time, the enamel is weakened and destroyed, forming a cavity.'),
      ServiceBox(
          name: "Dentures",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/dentures.jpg",
          desc:
              'Dentures are artificial teeth and gums that are formed to your mouth and created by your dentists to replace lost or removed natural teeth. Dentures can either be full or partial, meaning they can either replace all teeth on either the top or bottom gum line, or just a few that are missing. Regardless of what kind of dentures you may need, they will be custom designed to fit your mouth, and visually matched to your existing teeth. \n\nDentures not only improve the appearance of a smile that has multiple missing teeth, but they also keep the structure of the mouth sound by supporting the structures around the cheeks and lips. Dentures also make it possible to eat foods that require chewing, making it possible to keep your diet the same and ensure that you are properly nourished. Lastly, dentures are a viable solution to replace teeth that are causing serious pain and oral health issues, such as those with rotted roots or severe damage. Having dentures fitted means that troublesome teeth are eliminated and replaced with a strong and beautiful alternative. \n\nDentures are removable appliances that can replace missing teeth and help restore your smile. \n\n Dentures are prosthetic devices constructed to replace missing teeth, and are supported by the surrounding soft and hard tissues of the oral cavity.'),
      ServiceBox(
          name: "Braces & Aligners",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/braces-aligners.jpg",
          desc:
              'Braces (whether metal braces, ceramic, lingual or clear aligners like Invisalign), third molars, appearance and bad breath are just a few new things for your teenagers to worry about as they make the transition from childhood to adulthood. The best way for teens to enjoy a nice smile and healthy teeth is to start good oral habits as early as when their first permanent tooth comes out at age 5-6 years old. It is important to remember that aligners can treat most, but not all, orthodontic problems. Therefore, it is important that you chat with your orthodontist at your initial consultation about which option might help you get the best result. For many cases, however, both options are available which means you get to decide according to what you would prefer and what best suits your lifestyle.\n\nBraces are made of metal or porcelain and are attached to your teeth. Metal wires and rubber bands are then used to provide a force to help the teeth move into the correct position. \n\nAligners are made of plastic and are custom made to fit your teeth. Each aligner moves the teeth step by step towards the final position. Small bumps of composite resin (tooth coloured filling material) are attached to various teeth to help the aligner grip the tooth so it can be moved correctly.'),
      ServiceBox(
          name: "Root Canal Treatment",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/root-canal-treatment.jpg",
          desc:
              'Root canal treatment is a dental procedure that relieves pain caused by an infected or abscessed tooth. During the root canal process, the inflamed pulp is removed. The surfaces inside the tooth are then cleaned and disinfected, and a filling is placed to seal the space. \n\nRoot canal therapy is necessary when oral bacteria invade the pulp inside of your tooth. This usually happens when a cavity is left untreated for a long time. It can also occur if your tooth becomes cracked or damaged due to trauma. \n\nDepending on the amount of infection in your tooth, root canal therapy may require one or two appointments. On average, a root canal takes about 30 to 60 minutes to complete. If you are having treatment on a larger tooth with multiple roots, it can take up to an hour and a half.'),
      ServiceBox(
          name: "Wisdom Teeth Removal",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/wisdom-teeth-removal.jpg",
          desc:
              'Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth — the four permanent adult teeth located at the back corners of your mouth on the top and bottom.\n\n If a wisdom tooth doesn\'t have room to grow (impacted wisdom tooth), resulting in pain, infection or other dental problems, you\'ll likely need to have it pulled. Wisdom tooth extraction may be done by a dentist or an oral surgeon.\n\n To prevent potential future problems, some dentists and oral surgeons recommend wisdom tooth extraction even if impacted teeth aren\'t currently causing problems.'),
      ServiceBox(
          name: "Dental Implants",
          image:
              "https://abishekmahi.github.io/sais-dental-clinic/images/dental-implants.jpg",
          desc:
              'A dental implant is a structure that replaces a missing tooth. With screw-like devices, the surgeon inserts an implant into the jawbone, and it acts as an anchor for an artificial tooth, called a crown. \n\nDental implant systems consist of a dental implant body and dental implant abutment and may also include an abutment fixation screw. The dental implant body is surgically inserted in the jawbone in place of the tooth\'s root. The dental implant abutment is usually attached to the implant body by the abutment fixation screw and extends through gums into the mouth to support the attached artificial teeth. \n\n According to the American Academy of Implant Dentistry, around 3 million people in the United States have dental implants, and this number increases by about 500,000 every year. \n\nDental implant surgery is safe when a qualified and experienced surgeon or dentist performs it. It is also the only dental restoration option that maintains the health of the person’s jawbone and stimulates its growth.'),
      ServiceBox(
          name: "Teeth Whitening",
          image: "https://i.postimg.cc/SRMxmjMz/Teeth-Whitening.jpg",
          desc:
              'Teeth whitening involves bleaching your teeth to make them lighter. It can\'t make your teeth brilliant white, but it can lighten the existing colour by several shades. \n\nTeeth whitening is a form of dentistry and should only be carried out by a dentist or another regulated dental professional, such as a dental hygienist or dental therapist, on the prescription of a dentist. Some beauty salons offer teeth whitening, but this is illegal if there\'s no dental professional present, and it may put your oral health at risk.You can also buy DIY home teeth whitening kits but these may also carry risks. \n\nYellow, dull looking teeth bothering you? Then your solution might be in teeth whitening/teeth bleaching.Let your pearly whites shine and reflect your beauty. \n\n If you have your teeth whitened you\'ll first need to make 2 to 3 visits to the dental surgery.The dentist will take an impression of your teeth to make a mouthguard and tell you how to use it with a bleaching gel. Then, using your mouthguard at home, you regularly apply the gel for a specified period of time over a few weeks. Some whitening gels can be left on for up to 8 hours at a time, which can shorten the treatment period.Laser whitening, also known as power whitening, is another type of teeth whitening system that a dentist can provide. A bleaching product is painted onto your teeth and then a light or laser is shone on them to activate the whitening. Laser whitening takes about an hour.'),
    ];

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
          padding:
              const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Text(
                "Followings are our services",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
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
                      desc: myServices[index].desc,
                      ontouch: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: FullServices(snap: myServices[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceBox extends StatelessWidget {
  final String name;
  final String image;
  final String desc;
  void Function()? ontouch;

  ServiceBox({
    super.key,
    required this.name,
    required this.image,
    this.ontouch,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontouch,
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
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              ),
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

class FullServices extends StatelessWidget {
  final ServiceBox snap;
  const FullServices({super.key, required this.snap});

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
            snap.name,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          height: double.maxFinite,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: ExtendedImage.network(
                    snap.image,
                    fit: BoxFit.fitWidth,
                    cache: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  snap.name,
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF007EE6),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  snap.desc,
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
