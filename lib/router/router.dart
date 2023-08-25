import 'package:flutter/material.dart';
import 'package:psugo/page/donthavecar/homenavi_d.dart';
import 'package:psugo/page/havecar/postsharing.dart';
import 'package:psugo/page/choose.dart';
import 'package:psugo/page/havecar/confirm_t.dart';
import 'package:psugo/page/dcar.dart';
import 'package:psugo/page/havecar/editsharingcar.dart';
import 'package:psugo/page/hcar.dart';
import 'package:psugo/page/donthavecar/hellodcar.dart';
import 'package:psugo/page/havecar/hellohcar.dart';
import 'package:psugo/page/havecar/homenavi_h.dart';
import 'package:psugo/page/login.dart';
import 'package:psugo/page/havecar/profile_h.dart';
import 'package:psugo/page/donthavecar/transaction_d.dart';
import 'package:psugo/page/havecar/yourpost.dart';

final Map<String, WidgetBuilder> map = {
  '/hellohcar': (BuildContext context) => HelloHcar(),
  '/hellodcar': (BuildContext context) => HelloDcar(),
  '/choose': (BuildContext context) => Choose(),
  '/dcar': (BuildContext context) => Dcar(
        choosevehicle: 'don\'t have car',
      ),
  '/addsharingcar': (BuildContext context) => Postsharing(),
  '/hsar': (BuildContext context) => Hcar(
        choosevehicle: 'have car',
      ),
  '/login': (BuildContext context) => Login(),
  '/transaction': (BuildContext context) => TransactionD(),
  '/yourpost': (BuildContext context) => YourPost(
        date: '',
        finish: '',
        price: '',
        start: '',
        time: '',
      ),
  '/profile_h': (BuildContext context) => ProfileH(),
  '/confirm_t': (BuildContext context) => ConfirmT(),
  '/homenavi_h': (BuildContext context) => HomeNaviH(id: ''),
  '/homenavi_d': (BuildContext context) => HomeNaviD(id: ''),
};
