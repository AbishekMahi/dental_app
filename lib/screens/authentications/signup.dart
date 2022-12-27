// ignore_for_file: use_build_context_synchronously
import 'dart:typed_data';
import 'package:dental_app/resourses/auth_method.dart';
import 'package:dental_app/screens/authentications/login.dart';
import 'package:dental_app/screens/home-screen.dart';
import 'package:dental_app/utils/img_picker.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../utils/textfield.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  final fname = TextEditingController();
  final lname = TextEditingController();
  final phone = TextEditingController();
  Uint8List? imageUrl;
  final dateinput = TextEditingController();
  // String cdate = DateFormat("MM-dd-yyyy").format(DateTime.now());

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    cpassword.dispose();
    fname.dispose();
    lname.dispose();
    phone.dispose();
    super.dispose();
  }

  void selectImg() async {
    Uint8List img = await pickImg(ImageSource.gallery);
    setState(() {
      imageUrl = img;
    });
  }

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Lottie.asset('assets/lottie/loading.json', width: 150),
            ),
          ),
        );
      },
    );
    if (passwordConfirmed()) {
      String res = await AuthMethods().signupUser(
        fname: fname.text,
        lname: lname.text,
        file: imageUrl!,
        email: email.text,
        password: password.text,
        cpassword: cpassword.text,
        dateinput: dateinput.text,
        phone: phone.text,
        gender: dropdownValue,
      );
      if (res != 'Success') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()),
            (route) => false);
        showSnackBar(res, context);
      } else {}
    }
  }

// confirm Password
  bool passwordConfirmed() {
    if (password.text.trim() == cpassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  static const List<String> list = <String>[
    'Male',
    'Female',
  ];
  Widget controlsBuilder(context, details) {
    final isLastStep = currentStep == stepList().length - 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currentStep != 0)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: details.onStepCancel,
                color: const Color(0xFF00C75A),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Back",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: details.onStepContinue,
              color: const Color(0xFF00C75A),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  isLastStep ? 'Submit' : 'Next',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();

  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
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
        child: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Color(0xFF00C75A))),
          child: Form(
            key: _formKey,
            child: Stepper(
              currentStep: currentStep,
              type: StepperType.horizontal,
              steps: stepList(),
              elevation: 0,
              controlsBuilder: controlsBuilder,
              onStepContinue: () {
                final isLastStep = currentStep == stepList().length - 1;

                if (isLastStep) {
                  print('Completed');
                  // send data to server
                  if (_formKey.currentState!.validate()) {
                    // signup();
                    signUp();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "You missed to fill something",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 0,
                                color: Colors.black87),
                          ),
                        );
                      },
                    );
                  }
                } else {
                  setState(() {
                    currentStep += 1;
                  });
                }

                setState(() {});
              },
              onStepCancel: () {
                if (currentStep == 0) {
                  return;
                }
                currentStep -= 1;
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }

  int currentStep = 0;
  void getDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);
      setState(() {
        dateinput.text = formattedDate;
      });
    } else {}
  }

  List<Step> stepList() => [
        Step(
          state: currentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: currentStep >= 0,
          title: const Text("Details"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter your details',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // pickUploadImg();
                        selectImg();
                      },
                      child: imageUrl != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: MemoryImage(
                                imageUrl!,
                              ),
                            )
                          : const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/images/default-profile-pic.jpg',
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0x841F1F1F),
                        ),
                        child: const Icon(
                          Icons.add_a_photo_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // name, age and phone number
              CustomTextField(
                labelText: 'First Name',
                hintText: 'First Name',
                prefixIcon: Icons.account_circle_outlined,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: fname,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              CustomTextField(
                labelText: 'Last name',
                hintText: 'Last Name',
                prefixIcon: Icons.account_circle_outlined,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: lname,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter some text';
                //   }
                // },
              ),
              CustomTextField(
                labelText: 'Phone number',
                hintText: 'Phone number',
                prefixIcon: EvaIcons.phoneOutline,
                obscureText: false,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
                          .hasMatch(value)) {
                    return 'Invalid Phone number!';
                  }
                  return null;
                },
                controller: phone,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonFormField<String>(
                  dropdownColor: Colors.blue,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.transgender,
                      color: Colors.white,
                    ),
                    focusColor: Colors.black,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  value: dropdownValue,
                  // isExpanded: false,
                  icon: const Icon(
                    Icons.arrow_downward,
                    size: 26,
                    color: Colors.white,
                  ),
                  // elevation: 16,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      // value: 'Gender',
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // Select Date:
              AppointFormField(
                  labelText: 'Select Date (MM-dd-yyyy) :',
                  hintText: "Date Of Birth",
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
              // const SizedBox(
              //   height: 10,
              // ),
              // CustomTextField(
              //   labelText: 'Your age',
              //   hintText: 'Your age',
              //   prefixIcon: EvaIcons.calendarOutline,
              //   obscureText: false,
              //   keyboardType: TextInputType.number,
              //   controller: age,
              //   maxlength: 2,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter age';
              //     }
              //   },
              // ),
              const SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Step(
          state: currentStep <= 1 ? StepState.editing : StepState.complete,
          isActive: currentStep >= 1,
          title: const Text("Create account"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Signup Here!',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              // Email or phone number
              CustomTextField(
                labelText: 'Email Address',
                hintText: 'abc@example.com',
                prefixIcon: Icons.mail_outline_rounded,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid input!';
                  }
                  return null;
                },
                controller: email,
              ),

              // password
              PasswordField(
                labelText: 'Password',
                hintText: 'Enter Password',
                prefixIcon: EvaIcons.lockOutline,
                keyvalue: 'password',
                controller: password,
              ),
              PasswordField(
                labelText: 'Confirm Password',
                hintText: 'Re-Enter password',
                prefixIcon: EvaIcons.lockOutline,
                keyvalue: 'cpassword',
                controller: cpassword,
              ),
              // Sign button
              // Submit_Button(
              //   btntxt: 'SIGN UP',
              //   fontSize: 20,
              //   ontouch: () {
              //     signUp();
              //   },
              // ),
              const SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Have an account?',
                    style:
                        GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                  ),
                  TextButton(
                    child: Text(
                      'Login Here!',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: currentStep >= 2,
          title: const Text("Confirm"),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  // textAlign: TextAlign.center,
                  'Check Your Details Here and Click Submit to Signup',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 0,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: imageUrl != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage: MemoryImage(
                              imageUrl!,
                            ))
                        : const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/images/default-profile-pic.jpg',
                            ),
                          ),
                  ),
                ),
                Text(
                  'Full Name : ${fname.text} ${lname.text}',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'DOB : ${dateinput.text}',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Gender : $dropdownValue',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Phone Number : ${phone.text}',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Email : ${email.text}',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ];
}
