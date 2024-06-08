import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2/abc.dart';
import '../pages/home_page.dart';
import 'auth_page.dart';
class MainPage extends StatelessWidget{
  const MainPage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            return conversation();
          }else{
            return AuthPage();
          }
        }
      )
    );
  }
}

