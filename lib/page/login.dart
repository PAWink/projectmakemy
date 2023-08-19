import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psugo/augmentation/dialog.dart';
import 'package:psugo/page/choose.dart';
import 'package:psugo/page/donthavecar/homenavi_d.dart';
import 'package:psugo/page/havecar/homenavi_h.dart';
import 'package:psugo/page/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              Image(
                image: AssetImage('images/psugo.png'),
                width: 240,
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30), //ย่อหน้าใช้ padding
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  onChanged: (value) => email = value.trim(),
                                  decoration: InputDecoration(
                                      hintText: 'example@gmail.com',
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Password',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  obscureText: true,
                                  onChanged: (value) => password = value.trim(),
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Text(
                                  'Or',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Choose()));
                                  },
                                  child: Text(
                                    'Register a new account',
                                    style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                  child: ElevatedButton(
                                onPressed: () {
                                  formKey.currentState!.save();
                                  print('email = $email, password = $password');
                                  signInWithEmailAndPassword(context);
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.greenAccent,
                                  minimumSize: Size(80, 45),
                                ),
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )),
        backgroundColor: Color.fromARGB(255, 58, 164, 245));
  }

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
