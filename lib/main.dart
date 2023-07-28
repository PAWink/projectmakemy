import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/havecar/postsharing.dart';
import 'package:psugo/page/choose.dart';
import 'package:psugo/page/hcar.dart';
import 'package:psugo/page/donthavecar/hellodcar.dart';
import 'package:psugo/page/havecar/hellohcar.dart';
import 'package:psugo/page/login.dart';
import 'package:psugo/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

String initRout = '/choose';

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
      routes: map,
      initialRoute: initRout,
    );
  }
}
