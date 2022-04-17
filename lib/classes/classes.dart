import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    required this.inputFld,
    required this.autofocus,
    required this.controller,
    required this.obscureText,
    this.validator,
    this.onSaved,
    this.inputFormatters,
    required this.maxLength,
  });

  final String inputFld;
  final bool obscureText;
  final bool autofocus;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextFormField(
        autofocus: autofocus,
        controller: controller,
        inputFormatters: inputFormatters,
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
        maxLength: maxLength,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          counterText: "",
          hintText: inputFld,
          hintStyle: GoogleFonts.openSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class HeadLine extends StatelessWidget {
  HeadLine({
    required this.inputFld,
  });

  final String inputFld;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        inputFld,
        style: GoogleFonts.openSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class OnTapText extends StatelessWidget {
  OnTapText({required this.onTap, required this.text});
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          149,
          0,
          0,
          0,
        ),
        child: RichText(
          text: TextSpan(
            text: text,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: GoogleFonts.openSans(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton(
      {required this.color, required this.text, required this.onPress});

  final Color color;
  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialButton(
          color: color,
          // Color(0xFF1C2F97),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(63.0))),
          onPressed: onPress,
          //signIn(userNameController.text, passwordController.text);
          elevation: 5,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold))),
    );
  }
}

extension extString on String {
  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }
}
