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
  String dropdownValue = list.first;
  String datetime = DateTime.now().toString();
  String tdata = DateFormat("hh:mm a").format(DateTime.now());
  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  String? _selectedTime;
  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: false),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
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
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lottie/appointment.json', height: 200),

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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                isExpanded: true,
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Select Time:',
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          GestureDetector(
                            onTap: _show,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _selectedTime != null
                                          ? _selectedTime!
                                          : "$tdata (Change)",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Icon(
                                      Icons.access_time_outlined,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Select Date:',
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _selectedTime != null
                                          ? _selectedTime!
                                          : "$cdate (Change)",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Icon(
                                      Icons.date_range_outlined,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // book Appointment
                    Submit_Button(
                        btntxt: 'Book Appointment',
                        fontSize: 20,
                        ontouch: () {}),
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
