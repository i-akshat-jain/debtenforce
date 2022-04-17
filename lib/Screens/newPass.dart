import 'package:debtenforce/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/Screens/home_screen.dart';
import '/classes/classes.dart';
import 'forgotPass.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({Key? key}) : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

final String baseurl = "http://localhost:4000/";

class _NewPassScreenState extends State<NewPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = new TextEditingController();

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
                      HeadLine(inputFld: "Enter new password"),
                      InputField(
                        inputFld: "New Password",
                        autofocus: true,
                        controller: newPasswordController,
                        obscureText: true,
                        maxLength: 16,
                        validator: (value) {
                          // RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Please enter your password");
                          }
                          if (!value.isValidPassword) {
                            return ('Enter valid password');
                          }
                          // if (!regex.hasMatch(value)) {
                          //   return ("Enter Valid Password(Min. 6 Charcters");
                          // }
                        },
                        onSaved: (value) {
                          newPasswordController.text = value!;
                        },
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      InputField(
                        inputFld: "Re-renter New Password",
                        autofocus: true,
                        controller: newPasswordController,
                        obscureText: true,
                        maxLength: 16,
                        validator: (value) {
                          
                          if (value!.isEmpty) {
                            return ("Please enter your password");
                          }
                          if (!value.isValidPassword) {
                            return ('Enter valid password');
                          }
                          // if (!regex.hasMatch(value)) {
                          //   return ("Enter Valid Password(Min. 6 Charcters");
                          // }
                        },
                        onSaved: (value) {
                          newPasswordController.text = value!;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NextButton(
                          onPress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LogniScreen()));
                          },
                          color: Color(0xFF1C2F97),
                          text: "Set new password")
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

}
