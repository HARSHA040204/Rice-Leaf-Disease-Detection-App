import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_2/on_Boarding.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Onboarding(),
          ));
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"), // Replace "background_image.jpg" with the path to your image asset
            fit: BoxFit.cover, // You can adjust the fit as per your requirement
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image(
                  image: AssetImage("assets/lg.png"),
                  width: 250, // Set the desired width
                  height: 250, // Set the desired height
                ),
              ),
            ),
            const SizedBox(height: 10), // Add some space between image and text
            // Center(
            //   child: Image.asset(
            //     'assets/text.png', // Replace 'assets/agri_guardian_logo.png' with the path to your image
            //     width: 200, // Adjust the width as needed
            //     height: 200, // Adjust the height as needed
            //     // You can add other properties like fit, alignment, etc. as per your requirement
            //   ),
            // )


            // Text(
            //   "AGRI GUARDIAN",
            //   style: TextStyle(
            //     fontFamily: "Rowdies",
            //     fontWeight: FontWeight.w800,
            //     fontSize: 26,
            //     color: Colors.white,
            //     letterSpacing: 6,
            //     height: 1.0, // this sets the line height to 24
            //     shadows: [
            //       Shadow(
            //         blurRadius: 6.0,
            //         color: Color.fromARGB(124, 23, 23, 23),
            //         offset: Offset(2, 2),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
