import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2/pages/fotgot_pw_page.dart';

import '../abc.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> docId = [];

  Future<void> getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then((snapshot) => snapshot.docs.forEach((document) {
      print(document.reference);
      docId.add(document.reference.id);
    }));
  }

  // Future<void> signOut() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     Navigator.of(context).pop(); // Pop the current page to go back to the previous page
  //   } catch (e) {
  //     print("Error signing out: $e");
  //   }
  // }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Pop all routes until you reach the root route
      Navigator.of(context).popUntil((route) => route.isFirst);
    } catch (e) {
      print("Error signing out: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser; // Fetching user directly in the build method
    return PopScope(
        canPop: (false) ,

    child:  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B8F56),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        title: const Text(
          "AGRI GUARDIAN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "poppins",
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 5,
            height: 1.0,
            shadows: [
              Shadow(
                blurRadius: 6.0,
                color: Color.fromARGB(124, 23, 23, 23),
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/user.jpg"), height: 300, width: 200,),
            const SizedBox(height: 30),
            const Text('Email ', style: TextStyle(fontSize: 20),),
            Text(user?.email ?? 'Email not found', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  color: const Color(0xFF2B8F56),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Change Password', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: signOut,
                  color: const Color(0xFF2B8F56),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Sign out', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
