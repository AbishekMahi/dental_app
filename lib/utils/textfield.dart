import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final int? maxlength;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const CustomTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.prefixIcon,
      this.controller,
      this.maxlength,
      this.validator,
      this.keyboardType,
      required this.obscureText})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<CustomTextField> createState() => _CustomTextFieldState(
        labelText,
        hintText,
        prefixIcon,
        controller,
        keyboardType,
        obscureText,
        maxlength,
        validator,
      );
}

class _CustomTextFieldState extends State<CustomTextField> {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final int? maxlength;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  _CustomTextFieldState(
      this.labelText,
      this.hintText,
      this.prefixIcon,
      this.controller,
      this.keyboardType,
      this.obscureText,
      this.maxlength,
      this.validator);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: obscureText,
        maxLength: maxlength,
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
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
        ),
        validator: validator,
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final String keyvalue;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  const PasswordField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.prefixIcon,
      this.controller,
      this.onSaved,
      required this.keyvalue})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<PasswordField> createState() =>
      _PasswordFieldState(labelText, hintText, prefixIcon, controller, onSaved);
}

class _PasswordFieldState extends State<PasswordField> {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  bool _isHidden = true;

  _PasswordFieldState(this.labelText, this.hintText, this.prefixIcon,
      this.controller, this.onSaved);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onSaved: onSaved,
        // key: ValueKey(keyvalue),
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isHidden,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.white,
          ),
          suffixIcon: InkWell(
            onTap: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _isHidden = !_isHidden;
              });
            },
            child: Icon(
              _isHidden
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.white,
            ),
          ),
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
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
        ),
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                  .hasMatch(value)) {
            return 'Enter a valid password!';
          }
          return null;
        },
      ),
    );
  }
}

class SubjectField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final bool readOnly;
  final String? initialValue;
  final int? maxlength;
  final int? maxlines;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Function()? onTap;

  const SubjectField({
    Key? key,
    this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.obscureText,
    required this.readOnly,
    required this.controller,
    this.maxlength,
    this.maxlines,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style:
            GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF252525)),
        keyboardType: keyboardType,
        obscureText: obscureText,
        initialValue: initialValue,
        textCapitalization: TextCapitalization.sentences,
        maxLines: maxlines,
        maxLength: maxlength,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xDA252525),
          ),
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: const TextStyle(color: Color(0xDA252525)),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xDA252525)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xDA252525),
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xDA252525),
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFE30F00),
              width: 2.0,
            ),
          ),
          errorStyle: GoogleFonts.poppins(
            color: const Color(0xFFC70D00),
            fontSize: 14,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFC70D00),
              width: 2.0,
            ),
          ),
        ),
        validator: validator,
        onTap: onTap,
        readOnly: readOnly,
      ),
    );
  }
}

class MsgField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  // final bool obscureText;
  final int? maxlength;
  final int? maxlines;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  const MsgField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    // required this.obscureText,
    required this.controller,
    this.maxlength,
    this.maxlines,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        style:
            GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF252525)),
        // keyboardType: keyboardType,
        // obscureText: obscureText,
        textCapitalization: TextCapitalization.words,
        maxLines: maxlines,
        maxLength: maxlength,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xDA252525),
          ),
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: const TextStyle(color: Color(0xDA252525)),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xDA252525)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xDA252525),
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xDA252525),
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFE30F00),
              width: 2.0,
            ),
          ),
          errorStyle: GoogleFonts.poppins(
            color: const Color(0xFFC70D00),
            fontSize: 14,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFC70D00),
              width: 2.0,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}

class AppointFormField extends StatelessWidget {
  final String hintText;
  final String? labelText;
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
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          controller: controller, //editing controller of this TextField
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            hintStyle: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            hintText: hintText,
            prefixIcon: Icon(
              suffixIcon,
              color: Colors.white,
              size: 26,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.white,
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
              fontSize: 14,
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
                color: Colors.white,
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
