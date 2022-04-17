import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '/Screens/home_screen.dart';
import '/classes/classes.dart';
import 'login.dart';
import 'newPass.dart';

class OtpScreen extends StatefulWidget {

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

final String baseurl = "http://localhost:4000/";

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();

  //firebase
  final _auth = FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);

  get inputField => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
              child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CompanyName(),
                      SizedBox(
                        height: 70,
                      ),
                      HeadLine(inputFld: "Please Enter OTP"),
                      SizedBox(
                        height: 10,
                      ),
                      otpField(),
                      SizedBox(
                        height: 30,
                      ),
                      NextButton(
                          onPress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const NewPassScreen()));
                          },
                          color: Color(0xFF1C2F97),
                          text: "Submit"),
                    ],
                  ),
                ),
              ),
            ),
          ));
        }));
  }

  Widget CompanyName() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const <Widget>[
              Text("Debt",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Sunflower",
                      fontSize: 48,
                      color: Color(0xFFE54252),
                      fontWeight: FontWeight.w500)),
              Text("enforce",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Sunflower",
                      fontSize: 48,
                      color: Color(0xFF1C2F97),
                      fontWeight: FontWeight.w500)),
            ],
          ),
          Text("Agent",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Sunflower",
                  fontSize: 32,
                  color: Color(0xFF1C2F97),
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget otpField() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 42,
              otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: Color(0xFFF2F2F2),
                  backgroundColor: Color(0xFFF2F2F2),
                  borderColor: Color.fromARGB(255, 255, 255, 255)),
              style: TextStyle(fontSize: 17, color: Color(0xFF808080)),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onChanged: (pin) {
              print("Changed: " + pin);
            },
            onCompleted: (pin) {
              print("Completed: " + pin);
            }),
        ]);
  }
}
