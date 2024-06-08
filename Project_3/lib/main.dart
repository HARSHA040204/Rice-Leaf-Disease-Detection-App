import 'package:flutter/material.dart';
import 'package:project_2/Home.dart';
import 'package:project_2/constants.dart';
import 'package:project_2/pages/login_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth/main_page.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyDxpI1pzoAzjYgnOpzqvkOlQr4UWGUazhE",
      appId: "1:228854299839:android:d1ff046730499ad8321a0a",
      messagingSenderId: "228854299839",
      projectId: "hatespeechdetection-bot",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AGRI GUARDIAN',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Home()
      // home: MainPage()
    );
  }
}
