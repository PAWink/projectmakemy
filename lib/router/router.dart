import 'package:flutter/material.dart';
import 'package:psugo/page/addsharing.dart';
import 'package:psugo/page/choose.dart';
import 'package:psugo/page/dcar.dart';
import 'package:psugo/page/editsharingcar.dart';
import 'package:psugo/page/hcar.dart';
import 'package:psugo/page/hellodcar.dart';
import 'package:psugo/page/hellohcar.dart';
import 'package:psugo/page/login.dart';
import 'package:psugo/page/transaction.dart';
import 'package:psugo/page/yourpost.dart';

final Map<String, WidgetBuilder> map = {
  '/helloHcar': (BuildContext context) => HelloHcar(),
  '/helloDcar': (BuildContext context) => HelloDcar(),
  '/choose': (BuildContext context) => Choose(),
  '/dCar': (BuildContext context) => Dcar(),
  '/addSharingCar': (BuildContext context) => Addsharing(),
  '/editSharingCar': (BuildContext context) => EditSharingCar(),
  '/hCar': (BuildContext context) => Hcar(),
  '/login': (BuildContext context) => Login(),
  '/tranSaction': (BuildContext context) => Transaction(),
  '/yourPost': (BuildContext context) => YourPost(),
};
