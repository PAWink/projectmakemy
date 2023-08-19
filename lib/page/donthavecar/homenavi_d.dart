import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/donthavecar/hellodcar.dart';
import 'package:psugo/page/donthavecar/list_t.dart';
import 'package:psugo/page/donthavecar/profile_d.dart';
import 'package:psugo/page/donthavecar/transaction_d.dart';

class HomeNaviD extends StatefulWidget {
  const HomeNaviD({super.key, required id});

  @override
  State<HomeNaviD> createState() => _HomeNaviDState();
}

class _HomeNaviDState extends State<HomeNaviD> {
  int index = 1;
  final screen = [ListT(), HelloDcar(), ProfileD()];
  final items = [
    Icon(Icons.search, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.person, size: 30),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index],
      backgroundColor: Color.fromARGB(255, 204, 232, 254),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (index) => setState(
          () => this.index = index,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        color: Colors.blue,
      ),
    );
  }
}
