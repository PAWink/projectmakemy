import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/donthavecar/homenavi_d.dart';
import 'package:psugo/page/havecar/homenavi_h.dart';
import 'package:psugo/page/model/user_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return contro();
  }
}

class contro extends StatefulWidget {
  contro();

  @override
  _controState createState() => _controState();
}

class _controState extends State<contro> {
  _controState();
  var choosevehicle;
  var emaill;
  var id;
  UserModel loggedInUser = UserModel();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  //method ที่ใช้บ่อยคือ initState ที่เอาไว้ กำหนดค่าเริ่มต้น
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      //setState คือ การ rebuild ใหม่เพื่ออัพเดท Widget
      setState(() {
        emaill = loggedInUser.email.toString();
        choosevehicle = loggedInUser.choosevehicle.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  routing() {
    if (choosevehicle == 'have car') {
      return HomeNaviH(
        id: id,
      );
    } else {
      return HomeNaviD(
        id: id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return routing();
  }
}
