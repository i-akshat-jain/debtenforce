import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/login.dart';

const bool USE_EMULATOR = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_EMULATOR) {
    await _connectToFirebaseEmulator();
  }

  runApp(MyApp());
}

/// Connect to the firebase emulator for firestore and authentication
Future _connectToFirebaseEmulator() async {
  final localHostString = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  FirebaseFirestore.instance.settings = Settings(
    host: '$localHostString:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
  await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DebtEnforce',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LogniScreen(),
    );
  }
}
