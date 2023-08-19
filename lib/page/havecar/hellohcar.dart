import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/havecar/postsharing.dart';
import 'package:psugo/page/havecar/yourpost.dart';

class HelloHcar extends StatefulWidget {
  const HelloHcar({super.key});

  @override
  State<HelloHcar> createState() => _HelloHcarState();
}

class _HelloHcarState extends State<HelloHcar> {
  //size
  late double screenWidth;
  late double screenHeight;
  //get display name

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Hello, ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image(
                    image: AssetImage('images/psugo.png'),
                    width: screenWidth * 0.1,
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Image(
                  image: AssetImage('images/psugo.png'),
                  width: screenWidth * 0.58,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'Call with friend',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 110),
              child: Text(
                'Nobody go with you',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(right: 250),
              child: Text(
                'Manage',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Postsharing()));
              },
              child: Container(
                height: 70,
                margin: EdgeInsets.only(left: 40, right: 40), //ระยะห่างจากขอบจอ
                child: Card(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                        size: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Post sharing car',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => YourPost()));
              },
              child: Container(
                height: 70,
                margin: EdgeInsets.only(left: 40, right: 40), //ระยะห่างจากขอบจอ
                child: Card(
                  child: Row(
                    children: [
                      Icon(
                        Icons.paste_outlined,
                        color: Colors.blue,
                        size: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Your post',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      backgroundColor: Color.fromARGB(255, 204, 232, 254),
    );
  }
}
