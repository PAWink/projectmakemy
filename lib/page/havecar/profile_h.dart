import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/havecar/editprofile.dart';

class ProfileH extends StatefulWidget {
  const ProfileH({super.key});

  @override
  State<ProfileH> createState() => _ProfileHState();
}

class _ProfileHState extends State<ProfileH> {
  late double screenHeight;
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('images/psugo.png'),
                  height: screenHeight * 0.25,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Name: Havecar',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('Email: Havecar@g.com',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('Phone: 0617544589',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('Bank: 020277895812',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditProfile()));
                      },
                      child: Text('Edit profile'),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await Firebase.initializeApp().then((value) async {
                            await FirebaseAuth.instance.signOut().then(
                                (value) => Navigator.pushNamedAndRemoveUntil(
                                    context, '/login', (route) => false));
                          });
                        },
                        child: Text('Log out')),
                  ],
                )
              ],
            ),
          ],
        ),
      )),
      backgroundColor: Color.fromARGB(255, 204, 232, 254),
    );
  }
}
