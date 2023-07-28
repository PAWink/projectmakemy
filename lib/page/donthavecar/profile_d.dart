import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/donthavecar/editprofile_d.dart';

class ProfileD extends StatefulWidget {
  const ProfileD({super.key});

  @override
  State<ProfileD> createState() => _ProfileDState();
}

class _ProfileDState extends State<ProfileD> {
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
                Text('Name: Dontcar',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('Email: Dontcar@g.com',
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
                            builder: (context) => EditProfileD()));
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
