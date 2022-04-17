import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/Screens/home_screen.dart';
import '/classes/classes.dart';
import 'forgotPass.dart';

class LogniScreen extends StatefulWidget {
  const LogniScreen({Key? key}) : super(key: key);

  @override
  State<LogniScreen> createState() => _LogniScreenState();
}

final String baseurl = "http://localhost:4000/";

class _LogniScreenState extends State<LogniScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);

  get inputField => null;

  @override
  Widget build(BuildContext context) {
    //   keyboardType: TextInputType.name,
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return ("Enter some value");
    //     }
    //     return null;
    //   },
    //   onSaved: (value) {
    //     userNameController.text = value!;
    //   },
    // );
    // Password Fields
    // final passwordField = TextFormField(
    //   textInputAction: TextInputAction.done,
    //   decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.password),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "Password",
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       )),
    // );

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
                      HeadLine(inputFld: "Login To Continue!"),
                      InputField(
                        inputFld: "Mobile Number",
                        autofocus: true,
                        controller: userNameController,
                        obscureText: false,
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
                        height: 1,
                      ),
                      InputField(
                        inputFld: "Password",
                        autofocus: true,
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Please enter your password");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password(Min. 6 Charcters");
                          }
                        },
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      OnTapText(text:'Forgot Password?',onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  ForgotPassScreen()));
                          },),
                      SizedBox(
                        height: 20,
                      ),
                      NextButton(
                          onPress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                          },
                          color: Color(0xFF1C2F97),
                          text: "Login")
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
