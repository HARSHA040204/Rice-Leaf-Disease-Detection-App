import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../abc.dart';
class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  /// text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  // var _isObscured;
  // @override
  // void initState(){
  //   super.initState();
  //   _isObscured = true;
  // }
  bool _obscureText = true;


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
  Future signUp() async{
    ///authenticate user create user
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      ///add user
      addUserDetails(
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _emailController.text.trim(),
          int.parse(_ageController.text.trim()),);
    }

  }
  Future addUserDetails(String firstName,String lastName,String email,int age) async{
    await FirebaseFirestore.instance.collection('users').add({
      'first name':firstName,
      'last name' :lastName,

      'email':email,
    'age':age,
    });

  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim() == _confirmpasswordController.text.trim()){
      return true;
    }else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Center(
          child:SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 125),
                Text('Hello There',style: GoogleFonts.bebasNeue(fontSize: 40),),
                const SizedBox(
                  height: 20,
                ),
                const Text('Register below with your details',style: TextStyle(fontSize: 20),),
                const SizedBox(height: 35),

                ///First name text field
                Padding(padding:
                const EdgeInsets.symmetric(horizontal:25),
                  child: Container(

                    decoration: BoxDecoration(

                      color: const Color(0xFFA8F1A8),

                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // color of shadow
                          spreadRadius: 3, // spread radius
                          blurRadius: 8, // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: TextField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.face) ,
                            border: InputBorder.none,
                            hintText: 'First Name',
                            labelText: 'First Name'

                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                ///last name text field
                Padding(padding:
                const EdgeInsets.symmetric(horizontal:25),
                  child: Container(

                    decoration: BoxDecoration(

                      color: const Color(0xFFA8F1A8),

                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // color of shadow
                          spreadRadius: 3, // spread radius
                          blurRadius: 8, // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: TextField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.face) ,
                            border: InputBorder.none,
                            hintText: 'Last Name',
                            labelText: 'Last Name'

                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),



                ///Age text field
                Padding(padding:
                const EdgeInsets.symmetric(horizontal:25),
                  child: Container(

                    decoration: BoxDecoration(

                      color: const Color(0xFFA8F1A8),

                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // color of shadow
                          spreadRadius: 3, // spread radius
                          blurRadius: 8, // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: TextField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.date_range) ,
                            border: InputBorder.none,
                            hintText: 'Age',
                            labelText: 'Age'

                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),






                ///email text field
                Padding(padding:
                const EdgeInsets.symmetric(horizontal:25),
                  child: Container(

                    decoration: BoxDecoration(

                      color: const Color(0xFFA8F1A8),

                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // color of shadow
                          spreadRadius: 3, // spread radius
                          blurRadius: 8, // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.mail) ,
                          border: InputBorder.none,
                          hintText: 'Email',
                          labelText: 'Email'

                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ///password
                Padding(padding:
                const EdgeInsets.symmetric(horizontal:25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFA8F1A8),
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // color of shadow
                          spreadRadius: 3, // spread radius
                          blurRadius: 8, // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),

                      child: TextField(


                        controller: _passwordController,

                        decoration: const InputDecoration(
                          icon: const Icon(Icons.lock) ,
                          // suffixIcon:GestureDetector(onTap: (){
                          // setState(() {
                          //   _obscureText =! _obscureText;
                          // });
                          // },
                          // child: Icon(_obscureText? Icons.visibility: Icons.visibility_off)),

                          border: InputBorder.none,
                          hintText: 'Password',
                          labelText: "Password",

                        ),
                        obscureText: _obscureText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                ///confirm password
                Padding(
                  padding:
                const EdgeInsets.symmetric(horizontal:25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFA8F1A8),
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // color of shadow
                          spreadRadius: 3, // spread radius
                          blurRadius: 8, // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),

                      child: TextField(


                        controller: _confirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock) ,
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          fillColor: Colors.grey[200],


                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ///sign in button
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 76.0),
                  child: GestureDetector(
                    onTap:signUp ,
                //   onTap: () {
                //   // Navigate to another page
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const conversation()),
                //   );
                // },
                    child: Container(
                        padding:const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B8E56),
                          borderRadius: BorderRadius.circular(27),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3), // color of shadow
                              spreadRadius: 3, // spread radius
                              blurRadius: 8, // blur radius
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],

                        ),
                        child:const Center(
                          child: Text(
                            'SignUp',
                            style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                            ),

                          ),
                        )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ///not a member ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I am a member!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        ' Login now',
                        style: TextStyle(
                          color: Color(0xFF2B8E56),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.grey,
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],

                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}