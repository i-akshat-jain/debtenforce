import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '/Screens/home_screen.dart';
import '/classes/classes.dart';
import 'login.dart';
import 'otpScreen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

final String baseurl = "http://localhost:4000/";

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
                      HeadLine(inputFld: "Forgot Password?"),
                      InputField(
                        inputFld: "Mobile Number",
                        autofocus: true,
                        controller: userNameController,
                        obscureText: false,
                        maxLength: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9]"),
                          )
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Enter some value");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          userNameController.text = value!;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      NextButton(
                          onPress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OtpScreen()));
                          },
                          color: Color(0xFF1C2F97),
                          text: "Get OTP"),
                      SizedBox(
                        height: 20,
                      ),
                      NextButton(
                          onPress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LogniScreen()));
                          },
                          color: Color(0xFFC4C4C4),
                          text: "Cancel")
                    ],
                  ),
                ),
              ),
            ),
          ));
        }));
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 80,
      style: TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }

  // Login Function
  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: 'Login Successuful'),
  //               Navigator.of(context).pushReplacement(
  //                   MaterialPageRoute(builder: (context) => HomeScreen()))
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }
}
