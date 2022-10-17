import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import '../utils/submit_button.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

const List<String> list = <String>[
  'Bridges & Crowns',
  'Dentures',
  'Dental Fillings',
  'Braces & Aligners',
  'Root Canal Treatment',
  'Wisdom Teeth Removal',
  'Dental Implants',
  'Teeth Whitening'
];

class _BookingState extends State<Booking> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = list.first;
  String datetime = DateTime.now().toString();
  String tdata = DateFormat("hh:mm a").format(DateTime.now());
  String cdate = DateFormat("dd MMM yyyy").format(DateTime.now());

  //text editing controller for text field
  TextEditingController timeinput = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    timeinput.text = "";
    dateinput.text = "";
    super.initState();
  }

  void getTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = DateFormat('hh:mm a').format(parsedTime);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.

      setState(() {
        timeinput.text = formattedTime; //set the value of text field.
      });
    } else {
      return null;
      // print("Time is not selected");
    }
  }

  void getDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime
            .now(), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('MMM dd yyyy').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        dateinput.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Book Appointment",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lottie/appointment.json',
                          height: 200),
                      Text(
                        'Please Select these Fields to Book Appointment.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            height: 0,
                            color: Colors.black),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Select the type of Appointment:',
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                value: dropdownValue,
                                // isExpanded: false,
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  size: 30,
                                  color: Colors.black87,
                                ),
                                elevation: 16,
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Select time:
                      AppointFormField(
                        labelText: 'Select Time',
                        hintText: "$tdata (Select time)",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select Time';
                          }
                        },
                        controller: timeinput,
                        suffixIcon: Icons.access_time_rounded,
                        onTap: () {
                          getTime();
                        },
                      ),

                      // Select Date:
                      AppointFormField(
                          labelText: 'Select Time',
                          hintText: "$cdate (Select time)",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select Date';
                            }
                          },
                          controller: dateinput,
                          suffixIcon: Icons.calendar_month_outlined,
                          onTap: () {
                            getDate();
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      // book Appointment
                      Submit_Button(
                        btntxt: 'Book Appointment',
                        fontSize: 20,
                        ontouch: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    textAlign: TextAlign.center,
                                    "Plese Confirm Your Appointment Details",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        color: Colors.black87),
                                  ),
                                  content: SizedBox(
                                    height: 330,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "1. Appointment For : $dropdownValue",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              color: Colors.black87),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "2. Time : $timeinput",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              color: Colors.black87),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "3. Date : $datetime",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              color: Colors.black87),
                                          textAlign: TextAlign.left,
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MaterialButton(
                                              onPressed: () {
                                                print(timeinput);
                                                print(datetime);
                                              },
                                              color: const Color(0xFF00C75A),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  'Submit',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppointFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Function() onTap;

  const AppointFormField(
      {super.key,
      required this.onTap,
      required this.hintText,
      required this.suffixIcon,
      required this.controller,
      this.validator,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            labelText,
            style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          validator: validator,
          style: GoogleFonts.poppins(
              color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w400),
          controller: controller, //editing controller of this TextField
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            hintStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w400),
            hintText: hintText,
            suffixIcon: Icon(
              suffixIcon,
              color: Colors.black87,
              size: 30,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.black87,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 227, 15, 0),
                width: 2.0,
              ),
            ),
            errorStyle: GoogleFonts.poppins(
              color: const Color(0xFFC70D00),
              fontSize: 15,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Color(0xFFC70D00),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.black87,
                width: 2.0,
              ),
            ),
          ),

          readOnly: true, //set it true, so that user will not able to edit text
          onTap: onTap,
        ),
      ]),
    );
  }
}
