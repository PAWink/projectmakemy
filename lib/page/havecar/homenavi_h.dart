import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/havecar/confirm_t.dart';
import 'package:psugo/page/havecar/hellohcar.dart';
import 'package:psugo/page/havecar/profile_h.dart';

class HomeNaviH extends StatefulWidget {
  const HomeNaviH({super.key});

  @override
  State<HomeNaviH> createState() => _HomeNaviHState();
}

class _HomeNaviHState extends State<HomeNaviH> {
  //item bar
  final items = <Widget>[
    Icon(Icons.search, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.person, size: 30),
  ];
  //rount icon page start
  int index = 1;
  final screen = [ConfirmT(), HelloHcar(), ProfileH()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[index],
        backgroundColor: Color.fromARGB(255, 204, 232, 254),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.blue,
          animationDuration: Duration(milliseconds: 300),
          index: index,
          items: items,
          onTap: (index) => setState(
            () => this.index = index,
          ),
        ));
  }
}
