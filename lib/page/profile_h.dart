import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfileH extends StatefulWidget {
  const ProfileH({super.key});

  @override
  State<ProfileH> createState() => _ProfileHState();
}

class _ProfileHState extends State<ProfileH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await Firebase.initializeApp().then((value) async {
                    await FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/choose', (route) => false));
                  });
                },
                child: Text('Log out'))
          ],
        ),
      )),
    );
  }
}
