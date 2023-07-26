import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/addsharing.dart';
import 'package:psugo/page/choose.dart';
import 'package:psugo/page/hcar.dart';
import 'package:psugo/page/hellodcar.dart';
import 'package:psugo/page/hellohcar.dart';
import 'package:psugo/page/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Hcar(),
    );
  }
}
